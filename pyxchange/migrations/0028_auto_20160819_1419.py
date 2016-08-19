# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-19 11:19
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pyxchange', '0027_auto_20160818_1650'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='desc',
            field=models.CharField(help_text='Up to 500 char.', max_length=500, verbose_name='Description'),
        ),
        migrations.AlterField(
            model_name='image',
            name='rev_date',
            field=models.DateTimeField(auto_now=True, verbose_name='Last reviewed'),
        ),
        migrations.AlterField(
            model_name='image',
            name='upl_date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Uploaded'),
        ),
    ]
