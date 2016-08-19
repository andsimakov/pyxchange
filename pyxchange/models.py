from django.contrib.auth.models import Permission, User
from django.db import models
from datetime import datetime
from django.core.urlresolvers import reverse
from random import randint
from django.utils.baseconv import base56


class Image(models.Model):
    # For future auth feature implementation
    # user = models.ForeignKey(User, default=1)
    img = models.ImageField('Image', upload_to='%I')
    desc = models.CharField('Description', max_length=500, help_text='Up to 500 char.')
    slug = models.SlugField(max_length=6, unique=True)
    upl_date = models.DateTimeField('Uploaded', auto_now_add=True)
    rev_date = models.DateTimeField('Last reviewed', null=True)
    rev_count = models.PositiveIntegerField('Reviews', default=0)
    like_count = models.PositiveIntegerField('Likes', default=0)

    def get_absolute_url(self):
        return reverse('pyxchange:detail', kwargs={'slug': self.slug})

    def __str__(self):
        return '{} - {}'.format(self.slug, self.desc)

    # # This is for Generic Views way
    # def save(self, *args, **kwargs):
    #     #  Add a slug for an image
    #     self.slug = Image.gen_slug()
    #     super(Image, self).save(*args, **kwargs)

    @staticmethod
    def gen_slug():
        aslug = base56.encode(randint(0, 0x7fffffff))
        return aslug
