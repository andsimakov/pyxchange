# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-19 12:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pyxchange', '0028_auto_20160819_1419'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='rev_date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Last reviewed'),
        ),
    ]
