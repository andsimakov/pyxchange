from datetime import datetime
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic.edit import CreateView
from django.views import generic
from django.core.urlresolvers import reverse

from .models import Image
from .utils import generate_slug


class ImageCreate(CreateView):
    model = Image
    fields = ['img', 'desc']


class DetailView(generic.DetailView):
    model = Image
    template_name = 'pyxchange/detail.html'


def popular(request):
    return HttpResponse('Popular Image View')


def all(request):
    return HttpResponse('All Image View')


def index(request):
    if request.method == 'POST':
        new_image = Image()
        new_image.img = request.FILES['image']
        new_image.desc = request.POST.get('desc')
        new_image.slug = generate_slug()
        new_image.upl_date = datetime.now()
        new_image.save()

        return render(request, 'pyxchange/detail', {'slug': new_image.slug})
    else:
        return render(request, 'pyxchange/index.html')
