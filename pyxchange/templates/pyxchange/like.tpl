{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Liked Images{% endblock %}
{% block like_active %}active{% endblock %}

{% block body %}
  <div class="container">
    <div class="row text-center">
      <div class="col-md-10 col-md-offset-1">
        <h2>Most Adorable Images</h2>
        {% for image in images %}
          <div class="thumbnail animated fadeIn">
            <div>
              <a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img_thumbnail.url }}"
                                                                     title="{{ image.desc }}"/></a>
            </div>
            <div class="trash text-center">
              <span class="glyphicon glyphicon-heart red" aria-hidden="true"></span> {{ image.like_count }}
            </div>
          </div>
        {% endfor %}
      </div>
    </div>
  </div>
{% endblock %}