---
layout: page3
permalink: /curriculum/
title: curriculum
nav: true
cv_pdf: ElenoCastro_cv.pdf
---

<div class="cv">
	<header class="post-header cv-header">
            <div class="cv-header-main">
                <h1 class="post-title cv-title">Curriculum Vitae</h1>
                {% if page.description %}
                <p class="post-description">{{ page.description }}</p>
                {% endif %}
            </div>
            {% if page.cv_pdf %}
            <a href="{{ page.cv_pdf | prepend: 'assets/pdf/' | relative_url}}" target="_blank" rel="noopener noreferrer" class="cv-download-link">
                <i class="fas fa-file-pdf" aria-hidden="true"></i>
                <span>Download CV (PDF)</span>
            </a>
            {% endif %}
	</header>
	{% for entry in site.data.cv %}
        {% unless entry.title == "Conference Presentations" or entry.title == "Skills" or entry.title == "Grants" %}
		<div class="card mt-3 p-3">
			<h3 class="card-title" style="font-family:'Source Serif 4', serif">{{ entry.title }}</h3>
			<div>
			{% if entry.type == "list" %}
				<ul class="card-text font-weight-light list-group list-group-flush">
				{% for content in entry.contents %}
					<li class="list-group-item">{{ content}}</li>
				{% endfor %}
				</ul>
			{% elsif entry.type == "map" %}
				<table class="table table-sm table-borderless">
					{% for content in entry.contents %}
						<tr>
							<td class="p-0 pr-2 font-weight-bold text-right"><b>{{ content.name }}</b></td>
							<td class="p-0 pl-2 font-weight-light text-left">{{ content.value }}</td>
						</tr>
					{% endfor %}
				</table>
			{% elsif entry.type == "nested_list" %}
				<ul class="card-text font-weight-light list-group list-group-flush">
				{% for content in entry.contents %}
					<li class="list-group-item">
					<h5 class="font-italic">{{ content.title }}</h5>
					{% if content.items %}
						<ul class="subitems">
								{% for subitem in content.items %}
									<li><span class="subitem">{{ subitem }}</span></li>
								{% endfor %}
								</ul>
							{% endif %}
					</li>
				{% endfor %}
				</ul>
			{% elsif entry.type == "table" %}
				<ul class="card-text font-weight-light list-group list-group-flush">
				{% for content in entry.contents %}
					<li class="list-group-item">
						<div class="cv-entry">
							{% if content.year %}
								<div class="cv-year-col">
									<span class="cv-entry-year">
										{{ content.year }}
									</span>
								</div>
							{% endif %}
							<div class="cv-entry-content">
								{% if content.title %}
								<h6 class="title font-weight-bold ml-1 ml-md-4">{{content.title}}</h6>
								{% endif %}
								{% if content.description %}
									<ul class="items">
										{% for item in content.description %}
										    <li>
												{% if item.contents %}
													<span class="item-title">{{ item.title }}</span>
													<ul class="subitems">
													{% for subitem in item.contents %}
														<li><span class="subitem">{{ subitem }}</span></li>
													{% endfor %}
													</ul>
												{% else %}
													<span class="item">{{ item }}</span>
												{% endif %}
											</li>
										{% endfor %}
									</ul>
								{% endif %}
								{% if content.items %}
									<ul class="items">
										{% for item in content.items %}
											<li>
												{% if item.contents %}
													<span class="item-title">{{ item.title }}</span>
													<ul class="subitems">
													{% for subitem in item.contents %}
														<li><span class="subitem">{{ subitem }}</span></li>
													{% endfor %}
													</ul>
												{% else %}
													<span class="item">{{ item }}</span>
												{% endif %}
											</li>
										{% endfor %}
									</ul>
								{% endif %}
							</div>
						</div>
					</li>
				{% endfor %}
				</ul>
            {% elsif entry.type == "table-no-bullets" %}
                <ul class="card-text font-weight-light list-group list-group-flush">
                {% for content in entry.contents %}
                    <li class="list-group-item">
                        <div class="cv-entry">
                            {% if content.year %}
                                <div class="cv-year-col">
                                    <span class="cv-entry-year">
                                        {{ content.year }}
                                    </span>
                                </div>
                            {% endif %}
                            <div class="cv-entry-content">
                                {% if content.title %}
                                <h6 class="title font-weight-bold ml-1 ml-md-4">{{content.title}}</h6>
                                {% endif %}
                                {% if content.description %}
                                    <ul class="items">
                                        {% for item in content.description %}
                                            <li style="list-style-type: none;">
                                                {% if item.contents %}
                                                    <span class="item-title">{{ item.title }}</span>
                                                    <ul class="subitems">
                                                    {% for subitem in item.contents %}
                                                        <li><span class="subitem">{{ subitem }}</span></li>
                                                    {% endfor %}
                                                    </ul>
                                                {% else %}
                                                    <span class="item">{{ item }}</span>
                                                {% endif %}
                                            </li>
                                        {% endfor %}
                                    </ul>
                                {% endif %}
                                {% if content.items %}
                                    <ul class="items">
                                        {% for item in content.items %}
                                            <li>
                                                {% if item.contents %}
                                                    <span class="item-title">{{ item.title }}</span>
                                                    <ul class="subitems">
                                                    {% for subitem in item.contents %}
                                                        <li><span class="subitem">{{ subitem }}</span></li>
                                                    {% endfor %}
                                                    </ul>
                                                {% else %}
                                                    <span class="item">{{ item }}</span>
                                                {% endif %}
                                            </li>
                                        {% endfor %}
                                    </ul>
                                {% endif %}
                            </div>
                        </div>
                    </li>
                {% endfor %}
                </ul>
            {% endif %}
			</div>
		</div>
        {% endunless %}
	{% endfor %}
</div>
