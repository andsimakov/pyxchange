{% extends 'pyxchange/base.tpl' %}
{% block title %}Pyxchange Image Share. Add Yours{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h1>The Image Gallery. Add Yours</h1>
        {% if user.is_authenticated %}
            <div class="col-sm-12 col-md-6 animated fadeIn">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-horizontal" action="" role="form" method="post" enctype="multipart/form-data">
                            {% csrf_token %}
                            {% include 'pyxchange/form_template.tpl' %}
                            <div class="col-sm-offset-8 col-sm-4">
                                <button type="submit" class="btn btn-success">
                                    <span class="glyphicon glyphicon-upload" aria-hidden="true"></span> Upload
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        {% else %}
            <h3 class="text-primary">Review incognito. Log in to share and like</h3>
        {% endif %}
    </div>

    <div class="col-sm-offset-2 col-sm-10">
        <h2>Recent Uploads</h2>
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}">
                <img class="thumbnail animated rotateInDownRight" src="{{ image.img_thumb_large.url }}" title="{{ image.desc }}" />
            </a>
        {% endfor %}
    </div>
{% endblock %}