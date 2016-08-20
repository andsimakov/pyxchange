from datetime import datetime
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.views.generic.edit import CreateView
from django.views import generic
from django.db.models import F
from django.core.urlresolvers import reverse
from django import forms
from django.forms import ModelForm
from random import randint
from django.utils.baseconv import base56

from .models import Image

IMAGE_COUNT = 12


# class ImageCreate(CreateView):
#     model = Image
#     fields = ['img', 'desc']
#
#
# class ImageView(generic.DetailView):
#     model = Image
#     template_name = 'pyxchange/detail.tpl'


def gen_slug():
    return base56.encode(randint(0, 0x7fffffff))


def index(request):
    if request.method == 'POST':
        new_image = Image()
        new_image.img = request.FILES['image']
        new_image.desc = request.POST.get('desc')
        new_image.slug = gen_slug()
        new_image.save()
        return redirect(new_image)
    else:
        images = Image.objects.order_by('-upl_date')[:IMAGE_COUNT]
        return render(request, 'pyxchange/index.tpl', {'images': images})


def detail(request, slug):
    image = get_object_or_404(Image, slug=slug)
    # image.rev_count = F('rev_count') + 1
    image.rev_count += 1
    image.rev_date = datetime.now()
    image.save()
    return render(request, 'pyxchange/detail.tpl', {'image': image})


def show_popular(request):
    pop = Image.objects.order_by('-rev_count')[:IMAGE_COUNT]
    return render(request, 'pyxchange/popular.tpl', {'images': pop})


def show_all(request):
    images = Image.objects.order_by('-upl_date')
    return render(request, 'pyxchange/all.tpl', {'images': images})
