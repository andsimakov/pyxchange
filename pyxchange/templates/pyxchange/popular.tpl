{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Popular Images{% endblock %}

{% block body %}
    {{ images }}
    {% if recent %}
        {% for pict in images %}
            {{ images }}
        {% endfor %}
    {% endif %}
    <br /><br />
    <a href="#">All Images</a>
{% endblock %}