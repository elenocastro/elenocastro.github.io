---
layout: page
permalink: /publications/
title: publications
description: Research publications in reversed chronological order.
key_words: ['Journal Publications', 'Working Papers', 'Works in Progress']
nav: True
hide_page_header: true
---

<div class="publications">

{% for paper in page.key_words %}
  <h1 class="title" style="font-family:'Source Serif 4', serif">{{ paper }}</h1>
  {% bibliography -f papers --query @*[key_words = {{ paper }}]* %}
{% endfor %}

</div>
