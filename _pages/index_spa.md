---
layout: default
title: Blog Español
permalink: /blog_spanish/
nav: False
pagination:
  enabled: true
  collection: posts_spa
  permalink: /page/:num/
  per_page: 5
  sort_field: date
  sort_reverse: true
  trail:
    before: 1 # The number of links before the current page
    after: 5  # The number of links after the current page
---
<!--Buttom to spanish-->
<a class="btn draw-border" href="https://www.elenocastro.com/blog/" style="text-align: right;">English</a>

<div class="post">


  <ul class="post-list">
    {% assign post_spa = paginator.posts %}
    {% for post in post_spa %}
            <li>
                <!--Just to add an image for each post-->
                {% if post.image %}       
                <div class="col-xs-8 col-sm-5 p-0 pt-3 pb-sm-0 pb-10 pl-sm-4" style="float: right; max-width:340px; max-height: 200px; overflow: hidden;">
                <img class="img-fluid" src="{{ post.image }}">
                </div>
                {% endif %}
                <h3 style="font-family: 'Playfair Display', serif; text-align: left;"><a class="post-title" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h3>
                <p class="post-meta">{{ post.date | date: '%B %-d, %Y' }}</p>
                <p>{{ post.description }}</p>
            </li>
    {% endfor %}
  </ul>

  {% include pagination.html %}

</div>
