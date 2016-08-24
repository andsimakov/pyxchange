{% extends 'pyxchange/base.tpl' %}
{% block title %}Your images{% endblock %}
{% block cabinet_active %}active{% endblock %}

{% block body %}
    <div class="container">
    <div class="row text-center">

    <div class="col-md-10 col-md-offset-1">
        {% if images %}
            <h2>Your Uploads</h2>
            {% for image in images %}
                <div class="thumbnail animated flipInX">
                    <div>
                        <a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img_thumbnail.url }}" title="{{ image.desc }}" /></a>
                    </div>
                    <div class="trash text-center">
                        <a href="{% url 'pyxchange:delete' image.slug %}"><b class="text-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></b></a>
                    </div>
                </div>
            {% endfor %}
        {% else %}
            <h4>You don’t have images</h4>
        {% endif %}
    </div>

    </div>
    </div>
{% endblock %}