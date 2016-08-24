{% extends 'pyxchange/base.tpl' %}
{% block title %}Pyxchange Image Share. Add Yours{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h1>Image Gallery. Add Yours</h1>
        {% if user.is_authenticated %}
            <form action="" method="post" enctype="multipart/form-data">
                {% csrf_token %}
                {% include 'pyxchange/form_template.tpl' %}
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">Upload</button>
                    </div>
                </div>
            </form>
        {% else %}
            <h3 class="text-warning">Review incognito. Log in to share and like.</h3>
        {% endif %}
    </div>
    <div class="col-sm-offset-2 col-sm-10">
        <hr />
        <h2>Recent Uploads</h2>
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}">
                <img class="thumbnail animated rotateInDownRight" src="{{ image.img_thumb_large.url }}" title="{{ image.desc }}" />
            </a>
        {% endfor %}
    </div>
{% endblock %}