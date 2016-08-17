from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from django.views.generic.edit import CreateView
from django.views import generic

from .models import Image


def index(request):
    if request.method == 'GET':
        return render(request, 'pyxchange/index.html')
    elif request.method == 'POST':
        img = request.FILES.get('image')
        desc = request.POST.get('desc')
        Image.objects.create(
            img=img,
            desc=desc,
            key=Image.create_key(),
            upl_date=datetime.now(),
            rev_date=datetime.now())
        return render(request, 'pyxchange/index.html')


def popular(request):
    return HttpResponse('Popular Image View')


def all(request):
    return HttpResponse('All Image View')


class DetailView(generic.DetailView):
    model = Image
    template_name = 'pyxchange/detail.html'


class ImageCreate(CreateView):
    model = Image
    fields = ['img', 'desc', 'key', 'upl_date', 'rev_date']
