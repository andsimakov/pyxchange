{% extends 'pyxchange/base.tpl' %}
{% block title %}All Images{% endblock %}

{% block body %}
    {{ images }}
    {% if recent %}
        {% for pict in images %}
            {{ images }}
        {% endfor %}
    {% endif %}
{% endblock %}