{% extends 'pyxchange/base.tpl' %}
{% block title %}Pyxchange Image Share. Add Yours{% endblock %}

{% block body %}
    <h3>Add an image</h3>
    <form action="" method="post" enctype="multipart/form-data">
        {% csrf_token %}
        <input type="file" name="image" />
        <label for="desc">Image descrition</label>
        <input name="desc" id="desc" type="text" />
        <button type="submit">Upload</button>
    </form>
    <br />
    {{ images }}
    {% if recent %}
        {% for pict in images %}
            {{ images }}
        {% endfor %}
    {% endif %}
    <br /><br />
    <a href="#">All Images</a>
{% endblock %}