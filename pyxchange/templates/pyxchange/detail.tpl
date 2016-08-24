{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    <div style="text-align: center;">
        <img class="img-thumbnail animated fadeIn" src="{{ image.img.url }}" width="600">
        <div class="animated fadeIn">
            <table class="details">
                <tr>
                    <td colspan="2"><h3><b>{{ image.desc }}</b></h3></td>
                </tr>
                <tr>
                    <td class="col1 text-primary"><span class="glyphicon glyphicon-upload gi-2x"></span></td>
                    <td class="col2">{{ image.upl_date }}</td>
                </tr>
                <tr>
                    <td class="col1 text-primary"><span class="glyphicon glyphicon-scale gi-2x"></span></td>
                    <td class="col2">{{ image.img.size|filesizeformat }}</td>
                </tr>
                <tr>
                    <td class="col1 text-primary"><span class="glyphicon glyphicon-fullscreen gi-2x"></span></td>
                    <td class="col2">{{ image.img.width }}px (W) x {{ image.img.height }}px (H)</td>
                </tr>
                <tr>
                    <td class="col1 text-primary"><span class="glyphicon glyphicon-eye-open gi-2x"></span></td>
                    <td class="col2">{{ image.rev_count }}</td>
                </tr>
            </table>
            {% if user.is_authenticated %}
                <form action="" method="post">
                    {% csrf_token %}
                    <div class="form-group">
                        <button type="submit" name="like" class="btn btn-success">
                            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Like
                        </button>
                    </div>
                </form>
            {% endif %}
        </div>
    </div>
{% endblock %}