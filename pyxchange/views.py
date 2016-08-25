from datetime import datetime
from django.shortcuts import render, get_object_or_404, redirect
from random import randint
from django.utils.baseconv import base56
from django.db.models import F
from .forms import ImageForm
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import Image
from .forms import UserForm

# Number of latest images (popular, uploaded, paginator etc.)
IMAGE_COUNT = 12


def slug_gen():
    return base56.encode(randint(0, 0x7fffffff))


def index(request):
    form = ImageForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        image = form.save(commit=False)
        image.user = request.user
        image.img = request.FILES['img']
        image.desc = request.POST.get('desc')
        image.slug = slug_gen()
        image.save()
        return render(request, 'pyxchange/detail.tpl', {'image': image})
    images = Image.objects.order_by('-upl_date')[:IMAGE_COUNT]
    context = {'form': form, 'images': images}
    return render(request, 'pyxchange/index.tpl', context)


def detail(request, slug):
    image = get_object_or_404(Image, slug=slug)
    image.rev_count = F('rev_count') + 1
    image.rev_date = datetime.now()
    image.save()
    image.refresh_from_db()
    return render(request, 'pyxchange/detail.tpl', {'image': image})


def show_popular(request):
    popular_set = Image.objects.order_by('-rev_count')[:IMAGE_COUNT]
    return render(request, 'pyxchange/popular.tpl', {'images': popular_set})


def show_page(request):
    state = 'page'
    images = Image.objects.order_by('-upl_date')
    paginator = Paginator(images, IMAGE_COUNT)
    page = request.GET.get('page')
    try:
        images = paginator.page(page)
    except PageNotAnInteger:
        images = paginator.page(1)
    except EmptyPage:
        images = paginator.page(paginator.num_pages)
    return render(request, 'pyxchange/all.tpl', {'images': images, 'state': state})


def show_all(request):
    state = 'all'
    images = Image.objects.order_by('-upl_date')
    return render(request, 'pyxchange/all.tpl', {'images': images, 'state': state})


def cabinet(request):
    user_image_set = list(Image.objects.filter(user=request.user).order_by('-upl_date'))
    return render(request, 'pyxchange/cabinet.tpl', {'images': user_image_set})


def delete(request, slug):
    image = Image.objects.get(slug=slug)
    image.delete()
    return redirect('pyxchange:cabinet')


class UserFormView(View):
    form_class = UserForm
    template_name = 'pyxchange/signup.tpl'

    def get(self, request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():
            user = form.save(commit=False)
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user.set_password(password)
            user.save()

            user = authenticate(username=username, password=password)

            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('pyxchange:index')

        return render(request, self.template_name, {'form': form})


def login_user(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect('pyxchange:index')
            else:
                return render(request, 'pyxchange/login.tpl', {'error_message': 'Your account has been disabled'})
        else:
            return render(request, 'pyxchange/login.tpl', {'error_message': 'Invalid login'})
    return render(request, 'pyxchange/login.tpl')


def logout_user(request):
    logout(request)
    return redirect('pyxchange:index')
