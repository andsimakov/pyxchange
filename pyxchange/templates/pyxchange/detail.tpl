{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
  <div style="text-align: center;">
    <a href="javascript:history.go(-1);"><img class="img-thumbnail animated fadeIn" src="{{ image.img.url }}"
                                              width="600" title="Go back"></a>
    <div class="image-container animated fadeIn">
      <table class="details">
        <tr>
          <td colspan="2"><h3><b>{{ image.desc }}</b></h3></td>
        </tr>
        <tr>
          <td class="col1 text-primary"><i class="fa fa-upload fa-2x" aria-hidden="true"></i></td>
          <td class="col2">{{ image.upl_date }}</td>
        </tr>
        <tr>
          <td class="col1 text-primary"><i class="fa fa-balance-scale fa-2x" aria-hidden="true"></i></td>
          <td class="col2">{{ image.img.size|filesizeformat }}</td>
        </tr>
        <tr>
          <td class="col1 text-primary"><i class="fa fa-arrows fa-2x" aria-hidden="true"></i></td>
          <td class="col2">{{ image.img.width }}px (W) x {{ image.img.height }}px (H)</td>
        </tr>
        <tr>
          <td class="col1 text-primary"><i class="fa fa-eye fa-2x" aria-hidden="true"></i></td>
          <td class="col2">{{ image.rev_count }}</td>
        </tr>
        <tr>
          <td class="col1 text-primary"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></td>
          <td class="col2">{{ image.like_count }}</td>
        </tr>
      </table>
      {% if user.is_authenticated %}
        <div class="row">
          <a class="btn btn-success" href="{% url 'pyxchange:like' image.slug %}">
            <i class="fa fa-heart" aria-hidden="true"></i> Like
          </a>
        </div>
      {% endif %}
    </div>
  </div>
{% endblock %}