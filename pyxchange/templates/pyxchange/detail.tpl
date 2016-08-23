{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    <img src="{{ image.img.url }}" width="700" alt="Back" title="Back">
    <h1>{{ image.desc }}</h1>
    <ul>
        <li>Uploaded: {{ image.upl_date }}</li>
        <li>File size: {{ image.img.size|filesizeformat }}</li>
        <li>Dimensions: {{ image.img.width }}px (W) x {{ image.img.height }}px (H)</li>
        <li>Views: {{ image.rev_count }}</li>
        <li>Mine: {{ own_image.user }}</li>
    </ul>
    {% if user.is_authenticated %}
        <form action="" method="post">
            {% csrf_token %}
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" name="like" class="btn btn-success">Like</button>
                </div>
            </div>
        </form>
    {% endif %}
{% endblock %}