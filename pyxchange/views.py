from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from django.views.generic.edit import CreateView
from django.views import generic

from django.forms import ModelForm

from .models import Image


class ImageCreate(CreateView):
    model = Image
    fields = ['img', 'desc']


class DetailView(generic.DetailView):
    model = Image
    template_name = 'pyxchange/detail.html'


# def index(request):
#     if request.method == 'GET':
#         return render(request, 'pyxchange/index.html')
#     elif request.method == 'POST':
#         img = request.FILES.get('image')
#         desc = request.POST.get('desc')
#         Image.objects.create(
#             img=img,
#             desc=desc,
#             slug=Image.create_key(),
#             upl_date=datetime.now(),
#             rev_date=datetime.now())
#         return render(request, 'pyxchange/index.html')


def popular(request):
    return HttpResponse('Popular Image View')


def all(request):
    return HttpResponse('All Image View')
