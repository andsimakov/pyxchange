{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
  <div class="text-center">
    <a href="javascript:history.go(-1);"><img class="img-thumbnail animated fadeIn" src="{{ image.img.url }}"
                                              width="600" title="Go back"></a>
    <div class="image-container animated fadeIn">

    <div class="row text-center">
      <div class="nopadding col-sm-8 col-sm-offset-2 col-md-6 col-lg-4 col-md-offset-3 col-lg-offset-4">
        <h3>{{ image.desc }}</h3>
      </div>
    </div>

    <div class="row text-center">
      <div class="tbl-detail col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-lg-4 col-md-offset-3 col-lg-offset-4">
        <div class="nopadding col-md-3 col-xs-3">
          <div class="headr tlr"><i class="fa fa-upload fa-2x" aria-hidden="true"></i></div>
          <div class="tr blr">{{ image.upl_date|date:'Y.m.d' }}</div>
        </div>
        <div class="nopadding col-md-2 col-xs-2">
          <div class="headr"><i class="fa fa-hdd-o fa-2x" aria-hidden="true"></i></div>
          <div class="tr">{{ image.img.size|filesizeformat }}</div>
        </div>
        <div class="nopadding col-md-3 col-xs-3">
          <div class="headr"><i class="fa fa-arrows fa-2x" aria-hidden="true"></i></div>
          <div class="tr">{{ image.img.width }}×{{ image.img.height }}</div>
        </div>
        <div class="nopadding col-md-2 col-xs-2">
          <div class="headr"><i class="fa fa-eye fa-2x" aria-hidden="true"></i></div>
          <div class="tr">{{ image.rev_count }}</div>
        </div>
        <div class="nopadding col-md-2 col-xs-2">
          <div class="headr trr"><i class="fa fa-heart fa-2x" aria-hidden="true"></i></div>
          <div class="tr brr">{{ image.like_count }}</div>
        </div>
      </div>
    </div>

      {% if user.is_authenticated %}
        <div class="row">
          <a class="btn btn-success like" href="{% url 'pyxchange:like' image.slug %}">
            <i class="fa fa-heart" aria-hidden="true"></i> Like
          </a>
        </div>
      {% endif %}
    </div>
  </div>
{% endblock %}