{% extends 'pyxchange/base.tpl' %}
{% block title %}Pyxchange Image Share. Add Yours{% endblock %}

{% block body %}
    {% if user.is_authenticated %}
     <h3>Add Your Image</h3>
        <form action="" method="post" enctype="multipart/form-data">
            {% csrf_token %}
            {% include 'pyxchange/form_template.tpl' %}
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </form>
    {% else %}
        <h4 class="text-warning">You have to log in prior to upload your images</h4>
    {% endif %}
    <div class="col-sm-offset-2 col-sm-10">
        <hr />
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img.url }}" width="100" title="{{ image.desc }}" /></a>
        {% endfor %}
    </div>
{% endblock %}