# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-16 20:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pyxchange', '0004_auto_20160816_2332'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='desc',
            field=models.CharField(help_text='Up to 500 characters', max_length=500),
        ),
        migrations.AlterField(
            model_name='image',
            name='key',
            field=models.SlugField(max_length=6, unique=True),
        ),
    ]
