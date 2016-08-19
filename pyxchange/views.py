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


class ImageCreate(CreateView):
    model = Image
    fields = ['img', 'desc']


class ImageView(generic.DetailView):
    model = Image
    template_name = 'pyxchange/detail.tpl'


def show_popular(request):
    return HttpResponse('Popular Image View')


def show_all(request):
    return HttpResponse('All Image View')


def gen_slug():
    slug = base56.encode(randint(0, 0x7fffffff))
    return slug


def index(request):
    if request.method == 'POST':
        new_image = Image()
        new_image.img = request.FILES['image']
        new_image.desc = request.POST.get('desc')
        new_image.slug = gen_slug()
        new_image.save()
        print(new_image)
        return redirect(new_image)
    else:
        return render(request, 'pyxchange/index.tpl')


def detail(request, slug):
    image = get_object_or_404(Image, slug=slug)
    # image.rev_count = F('rev_count') + 1
    image.rev_count += 1
    image.rev_date = datetime.now()
    image.save()
    return render(request, 'pyxchange/detail.tpl', {'image': image})
