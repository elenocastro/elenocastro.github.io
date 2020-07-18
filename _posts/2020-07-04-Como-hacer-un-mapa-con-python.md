---
layout: distill
title: Como crear un gráfico de mapa en Python
description: Un tutorial para principiantes que esten iniciando a programar en Python para el manejo y visulización de datos. 
date: 2020-07-04
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

---
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/python_logo.png">
    </div>
</div>

Python es un lenguaje muy versatil que permite manejar datos y hacer visualizaciones de todo tipo. Si eres nuevo te recomiendo descargar el paquete de [Anaconda](https://www.anaconda.com/products/individual) y utilizar Jupyter como procesador de texto para ir viendo las gráficas a medida vas escribiendo el código.


## Preparando las librerías y las datos a utilizar
Primero importaremos las librerías que necesitamos para trabajar la información. Utilizaremos Pandas que es una librería para manejar datos, especialmente dataframes y series. Esta librería viene integrada con Anaconda.
La segunda librería que utilizaremos es Geopandas, esta nos permite trabajar archivos llamados shapefile, que contienen las formas y georeferencias que se utilizaremos para graficar los mapas. La ventaja de Geopandas que integra las funciones de Pandas.


<d-code block language="python">
  import pandas as pd
  import geopandas as gpd
</d-code>


Usualmente esta librería no viene integrada al instalar Anaconda. Sin embargo, puede ser fácilmente instalada con tan solo correr en una celda de Jupyter el siguiente código:


<d-code block language="python">
  ¡pip install geopandas
</d-code>


Descargaremos el <a href="https://www.cnr.gob.sv/geoportal/LIMITES_WGS_84_.zip" target="blank">shapefile (el mapa)</a>  de la página oficial del gobierno de El Salvador que contiene los limites políticos de los municipios . Para este ejercicio podemos usar tanto el archivo Lambert o WGS.
Abriremos el archivo en Jupyter:

<d-code block language="python">
  shapefile = gpd.read_file(direccion+'\LIM_MUNICIPAL.shp')
  shapefile.head(5)
</d-code>

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/tabla_shapefile.png">
    </div>
</div>

Abriremos luego los datos para colorear el mapa, para este ejemplo he descargado el número de accidentes viales por municipio de esta página web: <a href="http://transparencia.pnc.gob.sv/" target="blank">Portal de Transparencia de la Policía Nacional Civil</a> .

<d-code block language="python">
  acc_auto = pd.read_csv(direccion+r'\accidentes_auto.csv',encoding='utf-8')
  acc_auto.head(5)
</d-code>

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/tabla_acc_auto.png">
    </div>
</div>

Luego se debe unir la información a través de un [merge](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.merge.html). Al observar la información notamos que las llaves será el nombre del municipio (parte importante sería preparar la información para asegurarnos que los municipios tienen los mismos nombres, en el ejercicio asumiremos que sí).

<d-code block language="python">
  acc_auto = acc_auto[acc_auto['Año']==2019]
  shapefile = shapefile.merge(
                       right = acc_auto,
                       left_on = 'NA2',
                       right_on = 'Municipio',
                       how = 'left'
                       )
</d-code>

***
## Utilizando Geopandas
Usar Geopandas es sumamente fácil y está bastante bien integrado con [Matplotlib](https://matplotlib.org/). Necesitamos para hacer un simple mapa escribir .plot(column = 'variable').


<d-code block language="python">
  shapefile.plot(column = 'CHOQUE')
</d-code>

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/mapa_simple_1.png">
    </div>
</div>

### Añadiendo legenda
Podemos continuar añadir atributos al mapa para que se vea mejor como una legenda horizontal y con una barra de color de distintos niveles de Naranjas ('Oranges').

<d-code block language="python">
  shapefile.plot(
              column = 'CHOQUE', 
              legend = True, 
              legend_kwds = {
                'label': "Número de choques de vehiculos",
                'orientation': "horizontal"
                },
              cmap = 'Oranges'
              )
</d-code>

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/mapa_simple_2.png">
    </div>
</div>

Debido a que gran parte de los choques se concentran en algunas zonas específicas los colores más intensos se encuentran en unos pocos municipios mientras no se logra ver diferencia en el resto. Una idea para cambiar esto, es recodificar la variable como su logaritmo.

<d-code block language="python">
  import numpy as np

  shapefile['CHOQUE'] = shapefile['CHOQUE'].fillna(1)
  shapefile['CHOQUE_log'] = np.log10(shapefile['CHOQUE'])

  #replazando valores inf, -inf resultados de log(0)
  shapefile['CHOQUE_log'] = shapefile['CHOQUE_log'].replace([np.inf,-np.inf],0)

</d-code>

<br/>
Al correr nuevamente nuestro código anterior tendríamos un gráfico como el siguiente:

<d-code block language="python">
  shapefile.plot(
              column = 'CHOQUE_log', 
              legend = True, 
              legend_kwds = {
                'label': "Número de choques de vehiculos",
                'orientation': "horizontal"
                },
              cmap = 'Oranges'
              )
</d-code>
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/mapa_simple_2_log.png">
    </div>
</div>

### Utilizando matplotlib

Para mejorar muchas de las características del mapa se puede usar matplotlib. Esto nos permitirá ajustar mejor la barra de color, el tamaño del mapa, modificar ejes, entre otras cosas.

Si continuamos con el ejemplo, matplotlib nos permite ajustar la barra de color para que la legenda muestre una escala logarítmica.

<d-code block language="python">
import matplotlib.pyplot as plt
import matplotlib.colors as mplc
import matplotlib.ticker as ticker


#creando una figura en matplotlib y ajustando el tamaño deseado 
fig , ax = plt.subplots(1 ,figsize = (14,8))



shapefile.plot(
  column = 'CHOQUE', 
  legend = False, 
  cmap ='Oranges',
  ax = ax,
  norm = mplc.LogNorm(), #utilizando el logaritmo de la variable
  linewidth = 1, #ajustando el grosor de las lineas del mapa
  edgecolor ='black' #color de las lineas del mapa
  )


vmin = shapefile.CHOQUE.min()
vmax = shapefile.CHOQUE.max()

#agregando barra de color atraves de matplotlib

#ajsutando posición y dimensiones de la barra
cax = fig.add_axes([0.9, 0.2, 0.01, 0.6]) 
#atributos de la barra de color
sm = plt.cm.ScalarMappable(
                      cmap = 'Oranges', 
                      norm = mplc.LogNorm(vmin = vmin, vmax = vmax)
                      )
sm._A = []

#OPCIONAL
#formateando los números a absultos de lo contrario salieran a base 10 
formatter = ticker.LogFormatter(10, labelOnlyBase=False) 
cbr = fig.colorbar(
                  sm, 
                  cax = cax, 
                  format = formatter,
                  ticks = [1,10,100]
                  )

ax.set_title('Número de choques en El Salvador', fontsize = 25)

cbr.ax.tick_params(labelsize = 15) #tamaño de letra de las legendas

ax.axis('off') #desactivando los ejes de posicionamiento

plt.show()
</d-code>
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/mapa_3.png">
    </div>
</div>

### Generando un mapa con variables categóricas

En algunos casos nos interesaría colorear el mapa con valores categóricos. Para ello, dividiremos nuestra variable 'CHOQUE' en cuartiles a través de [pandas.cut](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.cut.html#:~:text=Use%20cut%20when%20you%20need,pre%2Dspecified%20array%20of%20bins.):

<d-code block language="python">
labels = ['Cuartil_1', 'Cuartil_2','Cuartil_3','Cuartil_4']

#creando columna con variables categoricas a partir de 'CHOQUE'
shapefile['CHOQUE_Cuartiles'] = pd.cut(
                        x = shapefile['CHOQUE_log'],
                        bins = 4, 
                        labels = labels
                        )


#utilizando matplotlib nuevamente
fig , ax = plt.subplots(1, figsize = (14,8))

#definiendo caracteristicas del mapa (categorical = True)
shapefile.plot(
  column = 'CHOQUE_Cuartiles', 
  categorical = True, 
  legend = True,
  cmap = 'Oranges',
  ax = ax,
  linewidth = 1,
  edgecolor = 'black',
  )



ax.axis('off')


fig.show()

</d-code>
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_3/mapa_4.png">
    </div>
</div>
