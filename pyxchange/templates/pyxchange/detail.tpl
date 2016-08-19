{% extends 'pyxchange/base.html' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    {{ mess }}
    <img src="{{ image.img.url }}" width="500">
    <h1>Description: {{ image.desc }}</h1>
    <h3>Uploaded: {{ image.upl_date }}</h3>
    <h4>File size: {{ image.img.size|filesizeformat }}</h4>
    <h4>Dimensions: {{ image.img.width }}px (W) x {{ image.img.height }}px (H)</h4>
    <h5>Views: {{ image.rev_count }}</h5>
{% endblock %}