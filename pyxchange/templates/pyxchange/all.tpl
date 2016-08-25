{% extends 'pyxchange/base.tpl' %}
{% block title %}All Images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
<div class="container">
    <div class="row text-center">
        <h2>All Images</h2>
        <div class="col-md-10 col-md-offset-1">
            {% for image in images %}
                <a href="{% url 'pyxchange:detail' image.slug %}"><img class="thumbnail animated fadeIn" src="{{ image.img_thumbnail.url }}" title="{{ image.desc }}" /></a>
            {% endfor %}
        </div>
    </div>

    <div class="row text-center">
         <ul class="pagination">
            {% if images.has_previous %}
                <li><a href="?page={{ images.previous_page_number }}">Prev</a></li>
            {% endif %}
            {% for page in images.paginator.page_range %}
                <li class="{% if images.number == page  %}active{% endif %}"><a href="?page={{ page }}">{{ page }}</a></li>
            {% endfor %}

            {% if images.has_next %}
                <li> <a href="?page={{ images.next_page_number }}">Next</a></li>
            {% endif %}

            {% if state == 'all' %}
                <li><a href="{% url 'pyxchange:page' %}">Show Paginated</a></li>
            {% else %}
                <li><a href="{% url 'pyxchange:all' %}">Show All</a></li>
            {% endif %}
         </ul>
    </div>
</div>
{% endblock %}