# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-16 21:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pyxchange', '0007_auto_20160817_0001'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='last_review_date',
            field=models.DateTimeField(verbose_name='Last reviewed'),
        ),
        migrations.AlterField(
            model_name='image',
            name='like_count',
            field=models.PositiveIntegerField(default=0, verbose_name='Likes'),
        ),
        migrations.AlterField(
            model_name='image',
            name='review_count',
            field=models.PositiveIntegerField(default=0, verbose_name='Reviews'),
        ),
        migrations.AlterField(
            model_name='image',
            name='upload_date',
            field=models.DateTimeField(verbose_name='Uploaded'),
        ),
    ]
