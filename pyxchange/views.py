from datetime import datetime
from django.shortcuts import render, get_object_or_404, redirect
from random import randint
from django.utils.baseconv import base56
from django.db.models import F
from .forms import ImageForm
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django.views.generic.edit import DeleteView
from django.core.urlresolvers import reverse_lazy
from django.http import HttpResponseRedirect

from .models import Image, Like
from .forms import UserForm

# Number of latest images (popular, uploaded, etc.)
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
    pop = Image.objects.order_by('-rev_count')[:IMAGE_COUNT]
    return render(request, 'pyxchange/popular.tpl', {'images': pop})


def show_all(request):
    images = Image.objects.order_by('-upl_date')
    return render(request, 'pyxchange/all.tpl', {'images': images})


def cabinet(request):
    user_image_set = Image.objects.filter(user=request.user)
    return render(request, 'pyxchange/cabinet.tpl', {'images': user_image_set})


class ImageDelete(DeleteView):
    model = Image
    success_url = reverse_lazy('pyxchange:cabinet')


# def delete(request, slug):
#     image = Image.objects.get(slug=slug)
#
#     if image.user_id is request.user:
#         image.delete()
#         return redirect('pyxchange:index')
#     else:
#         context = {'message': 'You are not the owner!'}
#         return render(request, 'pyxchange/detail.tpl', context)


class UserFormView(View):
    form_class = UserForm
    template_name = 'pyxchange/register.tpl'

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
