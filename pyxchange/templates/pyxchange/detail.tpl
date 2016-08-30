{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
  <div style="text-align: center;">
    <a href="javascript:history.go(-1);"><img class="img-thumbnail animated fadeIn" src="{{ image.img.url }}"
                                              width="600" title="Go back"></a>
    <div class="image-container animated fadeIn">

    <div class="row text-center">
      <div class="col-md-6 col-md-offset-3">
        <h3><b>{{ image.desc }}</b></h3>
      </div>
    </div>

    <div class="row text-center">

      <div style="border: 1px solid black;" class="col-md-6 col-md-offset-3">
        <div class="col-md-3">
          <div class="col-md-12"><i class="fa fa-upload fa-2x" aria-hidden="true"></i></div>
          <div class="col-md-12">{{ image.upl_date }}</div>
        </div>
        <div class="col-md-2">
          <div class="col-md-12"><i class="fa fa-balance-scale fa-2x" aria-hidden="true"></i></div>
          <div class="col-md-12">{{ image.img.size|filesizeformat }}</div>
        </div>
        <div class="col-md-3">
          <div class="col-md-12"><i class="fa fa-arrows fa-2x" aria-hidden="true"></i></div>
          <div class="col-md-12">{{ image.img.width }}×{{ image.img.height }} px</div>
        </div>
        <div class="col-md-2">
          <div class="col-md-12"><i class="fa fa-eye fa-2x" aria-hidden="true"></i></div>
          <div class="col-md-12">{{ image.rev_count }}</div>
        </div>
        <div class="col-md-2">
          <div class="col-md-12"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></div>
          <div class="col-md-12">{{ image.like_count }}</div>
        </div>
      </div>

    </div>
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
          <td class="col2">{{ image.img.width }} × {{ image.img.height }} px</td>
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