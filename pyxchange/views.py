from datetime import datetime
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
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


class DetailView(generic.DetailView):
    model = Image
    template_name = 'pyxchange/detail.html'


def show_popular(request):
    return HttpResponse('Popular Image View')


def show_all(request):
    return HttpResponse('All Image View')


def gen_slug():
    slug = base56.encode(randint(0, 0x7fffffff))
    return slug


# def index(request):
#     if request.method == 'POST':
#         new_image = Image()
#         new_image.img = request.FILES['image']
#         new_image.desc = request.POST.get('desc')
#         new_image.slug = gen_slug()
#         new_image.save()
#
#         return render(request, 'pyxchange/detail.html', {'slug': new_image.slug})
#     else:
#         return render(request, 'pyxchange/index.html')
