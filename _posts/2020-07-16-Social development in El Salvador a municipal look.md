---
layout: distill
title: "Social development in El Salvador: a municipal look"
description: Contrary to what many think El Salvador has made progress in recent years, however, development has been heterogeneous among the municipalities.
date: 2020-07-16
comments: true

authors:
  - name: Eleno Castro
    url: https://twitter.com/ElenoCastro


# Below is an example of injecting additional post-specific styles.
# If you use this post as a template, delete this _styles block.
_styles: >
  .fake-img {
    background: #bbb;
    border: 1px solid rgba(0, 0, 0, 0.1);
    box-shadow: 0 0px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 12px;
  }
  .fake-img p {
    font-family: monospace;
    color: white;
    text-align: justify;
    margin: 12px 0;
    text-align: center;
    font-size: 16px;
  }

bibliography: 2020-07-14-Una-mirada-al-desarrollo-en-El-Salvador.bib
---

Despite the great pessimism that people in El Salvador handle due to corruption problems and the lack of credibility of public institutions, the country has made progress in terms of social development in recent years.

This is something that we must highlight and mention, especially to deny those people who assure us that we are worse than ever. There is no doubt that there is still a long way to go and that there are challenges that have not been met in the best way in recent years, but we can highlight some progress.

### Comparing apples with apples. What has happened to El Salvador's economic growth?

It is usually pointed out that El Salvador has had the worst economic performance in the region, having a constant low growth in recent years, while neighboring countries such as Honduras, Guatemala and Nicaragua have been able to grow more. However, this analysis leaves one factor aside and it is <b>population growth</b>. The countries with the highest population growth also have higher economic growth because more and more people enter the labor market. El Salvador is one of the countries in the region with the lowest population growth, due to a drop in the fertility rate in recent years and high migration rates.

Economists use growth in GDP per capita to take this factor into account, as it does not matter if the pie is getting bigger if there are more people to divide it. When considering this indicator, El Salvador has done so at a level very similar to the region, even above countries such as Guatemala and Honduras<d-cite key="WDI"></d-cite>.


#### Average GDP Growth per Capita until 2019
{% include post_5/gdp_percapita_eng.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

Does this mean that El Salvador has no growth problems? Well, it is very likely that it really does. El Salvador has a very small local market that prevents the country from having a strengthened service sector, and it has also failed to integrate into important production chains worldwide and is observed at a low level of exports that the country maintains. This diagnosis is also shared for other countries in the region.

### Poverty and inequality have been falling

On the other hand, El Salvador has managed to reduce poverty and has maintained a trend like the region. When compared to the percentage of people living with less than <span>$</span>3.30 a day, the country has managed to maintain the same trend as Panama - standing only 2 percentage points above - despite the fact that El Salvador has not had the same Panama’s economic growth. The same cannot be said for the percentage of people living with less than <span>$</span>5.50 a day, where the country still has a high percentage of its population in this condition<d-cite key="WDI"></d-cite>.

{% include post_5/pobreza_wb_eng.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

The inequality measured by the [GINI](https://en.wikipedia.org/wiki/Gini_coefficient) has also fallen admirably in El Salvador compared to all the countries in the region, El Salvador maintains an indicator 8 points lower than Nicaragua (the second lowest in Central America). This could explain why, despite the modest economic growth, the country has reduced the most extreme levels of poverty<d-cite key="WDI"></d-cite>.

#### Inequality - GINI index since 1990
{% include post_5/gini_wb_eng.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

### Where is economic and social development taking place in El Salvador?

Economic and social development is usually not homogeneous even within the same country, and we can see this even in the small country of El Salvador. We usually do not know which municipalities are having better economic and social performance and therefore it is impossible to answer the question what local public policies are having an effect.

Municipalities are heterogeneous with each other, some more than others. El Salvador has municipalities with densely populated cities, others with a high level of local tourism, some with an educational system with a high percentage of single teacher schools, and municipalities with high levels of remittances. However, little is asked about how each one is doing individually and who is doing better.

My goal is not to answer these questions, but to provide a starting point for future researchers who want to go into this type of research. The country has a valuable tool: <b>The Multi-Purpose Household Surveys</b>. However, very little has been used of the more granular level of representativeness of such surveys. These collect data representative of 50 municipalities, it is worth mentioning that these municipalities concentrate a large part of the population and that it could be enough to make an exploratory analysis. In this blog I have taken the municipalities with the best indicators to make a brief analysis.


### What is happening in the municipalities?

The municipalities have reduced poverty as expected due to the national trend. The municipalities that remain in the lead are Antiguo Cuscatlán, San Salvador and Santa Tecla with 5%, 11% and 15% of their citizens living in poverty respectively, followed by Mejicanos and Ayutuxtepeque. Some municipalities with an important decrease in poverty levels are: San Miguel, Nejapa, Santiago Nonualco, Ilopango and Sonsonate with a drop of at least 15 percentage points in poverty<d-cite key="EHPM"></d-cite>.

#### Poverty ratio between 2010 and 2018
{% include project_3/pobreza_2010_2018_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

A modest growth is observed in the average income<d-footnote>Household income divided by the number of members living in</d-footnote> of the municipalities of the Metropolitan Area of San Salvador, with the exception of Antiguo Cuscatlán. In San Salvador, Mejicanos and Santa Tecla the average income has only increased <span>$</span>51, <span>$</span>26 and <span>$</span>22 dollars respectively between 2010 and 2018. However, they remain at the forefront as the municipalities with the highest incomes in the country.

On the other hand, for the same period municipalities such as Antiguo Cuscatlán and Ilopango have had an increase of almost <span>$</span>156 and <span>$</span>82 respectively. For its part, Antiguo Cuscatlán is a municipality with an income level much higher than the others, 10 years ago it already had an average income higher than the Santa Tecla today. And wealth continues to be concentrated in this area specifically and the gap with other municipalities is widening.

#### Average Income by Municipality between 2010 and 2018
{% include project_3/ingreso_promedio_municipio_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

In Education, municipalities such as Soyapango and San Salvador have not been able to improve the level of schooling of their inhabitants, presenting an increase of only 0.4 and 0.3 years of schooling between 2010 and 2018. Antiguo Cuscatlán, on the other hand, also leads the best indicators of schooling in the country, having a much higher increase than other municipalities. It is the only municipality in which its inhabitants have on average completed high school (11 years of schooling). Other municipalities such as Cuscatancingo, Cojutepeque and Santo Tomas have also had a significant increase in the education of their inhabitants - 1.5, 1.3 and 1.3 years respectively. However, most municipalities are still a long way from having a population with years of compulsory education.

#### Years of average schooling
{% include project_3/escolaridad_promedio_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

For those who want to explore the data a little further at the municipal level I have created more charts [here](https://www.elenocastro.com/projects/3_Indicadores%20municipales/).
