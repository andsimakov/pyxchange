{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    <img src="{{ image.img.url }}" width="500">
    <h1>{{ image.desc }}</h1>
    <ul>
        <li>Uploaded: {{ image.upl_date }}</li>
        <li>File size: {{ image.img.size|filesizeformat }}</li>
        <li>Dimensions: {{ image.img.width }}px (W) x {{ image.img.height }}px (H)</li>
        <li>Views: {{ image.rev_count }}</li>
    </ul>
{% endblock %}