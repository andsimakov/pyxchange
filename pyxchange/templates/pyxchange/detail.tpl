{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    <div class="container">
        <div class="row">
            <img class="img-thumbnail animated fadeIn" src="{{ image.img.url }}" width="700">
            <div class="animated fadeInUp">
                <h2>{{ image.desc }}</h2>
                <ul>
                    <li>Uploaded: {{ image.upl_date }}</li>
                    <li>File size: {{ image.img.size|filesizeformat }}</li>
                    <li>Dimensions: {{ image.img.width }}px (W) x {{ image.img.height }}px (H)</li>
                    <li>Views: {{ image.rev_count }}</li>
                </ul>
                {% if user.is_authenticated %}
                    <form action="" method="post">
                        {% csrf_token %}
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="like" class="btn btn-success"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Like</button>
                            </div>
                        </div>
                    </form>
                {% endif %}
            </div>
        </div>
    </div>
{% endblock %}