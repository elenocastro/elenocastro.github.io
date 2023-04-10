---
layout: default
title: Blog Español
permalink: /blog_spanish/
nav: False
pagination:
  enabled: true
  collection: posts_spa
  permalink: /page/:num/
  per_page: 4
  sort_field: date
  sort_reverse: true
  trail:
    before: 1 # The number of links before the current page
    after: 4 # The number of links after the current page
---

<!--Buttom to spanish-->
<a class="btn draw-border" href="{{ site.baseurl }}/blog/" style="text-align: right;">English</a>

<div class="content-box clearfix">
  {% assign post_spa = paginator.posts %}
  {% for post in post_spa %}
  <article class="post_index">
    {% if post.image %}
      <a class="post-thumbnail" style="background-image: url({{ site.url }}{{ post.image }})" href="{{post.url | prepend: site.baseurl}}"></a>
    {% else %}
    <a class="post-thumbnail" style="background-image: url({{ site.image }})" href="{{post.url | prepend: site.baseurl}}"></a>
    {% endif %}
    <div class="post-content">
      {% if post.published %}
      <span class="badge font-weight-bold red darken-1 text-uppercase align-middle" style="color: red">
			{{ post.published }}
			</span>
      {% endif %}
      <h3 class="post-title" style="font-family: 'Playfair Display', serif; text-align: left"><a  href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h3>
      <p class="post-meta">{{ post.date | date: '%B %-d, %Y' }}&nbsp;&nbsp;&nbsp;&nbsp;</p>
      <p>{{ post.description | strip_html | truncatewords: 30 }}</p>
    </div>
  </article>
  {% endfor %}
</div>

{% include pagination.html %}


