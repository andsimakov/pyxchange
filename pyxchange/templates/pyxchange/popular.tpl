{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Popular Images{% endblock %}
{% block popular_active %}active{% endblock %}

{% block body %}
    <div class="container">
        <div class="row text-center">
            <div class="col-md-10 col-md-offset-1">
                <h2>Most Popular Images</h2>
                {% for image in images %}
                    <a href="{% url 'pyxchange:detail' image.slug %}"><img class="thumbnail animated rollIn" src="{{ image.img_thumbnail.url }}" title="{{ image.desc }}" /></a>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}