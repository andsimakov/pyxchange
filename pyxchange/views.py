from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from .models import Image
from django.views.generic.edit import CreateView


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


def pic_detail(request, key):
    return HttpResponse('Image Page View')


class ImageCreate(CreateView):
    model = Image
    fields = ['img', ]