from datetime import datetime
from django.shortcuts import render, get_object_or_404, redirect
from random import randint
from django.utils.baseconv import base56
from django.db.models import F
from .forms import ImageForm
from django import forms

from .models import Image

IMAGE_COUNT = 12


def gen_slug():
    return base56.encode(randint(0, 0x7fffffff))


def index(request):
    form = ImageForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        image = form.save(commit=False)
        image.img = request.FILES['img']
        image.desc = request.POST.get('desc')
        image.slug = gen_slug()
        image.save()
        return render(request, 'pyxchange/detail.tpl', {'image': image})
    images = Image.objects.order_by('-upl_date')[:IMAGE_COUNT]
    context = {'form': form, 'images': images}
    return render(request, 'pyxchange/image_form.tpl', context)


def detail(request, slug):
    image = get_object_or_404(Image, slug=slug)
    image.rev_count = F('rev_count') + 1
    image.rev_date = datetime.now()
    image.save()
    image.refresh_from_db()
    return render(request, 'pyxchange/detail.tpl', {'image': image})


def show_popular(request):
    pop = Image.objects.order_by('-rev_count')[:IMAGE_COUNT]
    return render(request, 'pyxchange/popular.tpl', {'images': pop})


def show_all(request):
    images = Image.objects.order_by('-upl_date')
    return render(request, 'pyxchange/all.tpl', {'images': images})


# def like(request, slug):
#     image = get_object_or_404(Image, slug=slug)
#     image.like_count = F('like_count') + 1
#     image.save()
