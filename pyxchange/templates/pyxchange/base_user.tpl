<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="{% block title %}Pyxchange{% endblock %}" />
    <meta name="keywords" content="" />
    <title>{% block title %}Pyxchange{% endblock %}</title>
    {% load staticfiles %}
    <link rel="shortcut icon" type="image/png" href="{% static 'pyxchange/images/favicon.png' %}"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Baloo+Da|Open+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/style.css' %}"/>
    <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/animate.css' %}"/>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </head>
  <body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <!-- Header -->
      <div class="navbar-header">
        <a class="navbar-brand" href="{% url 'pyxchange:index' %}">Pyxchange</a>
      </div>
    </div>
  </nav>
  {% block body %}
  {% endblock %}
  </body>
</html>
