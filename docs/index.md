---
title: "Visualizing Time Series Data in R"
subtitle: "El segundo curso en el programa de Análisis de Series de tiempo de DataCamp"
author: "Raquel Arcos Bulos"
date: 2019-12-17
fig_width: 5
fig_height: 3
knit: (function(input_file, encoding) {
  out_dir <- 'docs';
  rmarkdown::render(input_file,
 encoding=encoding,
 output_file=file.path(dirname(input_file), out_dir, 'index.html'))})
output: 
        html_document:
            keep_md: true
---



## Introducción

Este documento reúne los gráficos generados en el curso [Visualizing Time Series Data in R](https://www.datacamp.com/courses/visualizing-time-series-data-in-r) de [DataCamp](https://www.datacamp.com/), el cual forma parte del track [Time Series with R](https://www.datacamp.com/tracks/time-series-with-r) de esta compañía dedicada a la Ciencia de Datos. Los ejemplos están principalmente enfocados a aplicaciones financieras pero una vez aprendidas las técnicas de procesamiento y visualización, es posible trabajar con datos para las ciencias sociales.     

El trabajo tiene por objeto construir un archivo en _R Markdown_ que pueda ser visto como una página web por los visitantes de _Git Hub_ sin que deban descargar archivo alguno ni correr código en R. El usuario en Git Hub es Raquel-Arcos.

La conexión entre _R Studio_ y _Git Hub_ se realizó a través de los implementos que el IDE tiene para ello lo que permite aprovechar las herramientas del segundo de forma rápida.

El diseño especial que tienen los gráficos se logra gracias a la librería _PerformanceAnalytics_. ¡Usa R!




```
##            yahoo microsoft citigroup dow_chemical
## 2015-01-02 50.17  44.30501  53.45259     42.48209
## 2015-01-05 49.13  43.89759  51.76803     41.16821
## 2015-01-06 49.21  43.25329  49.94556     40.50662
```

```
##            yahoo microsoft citigroup dow_chemical
## 2016-12-28 38.73     62.99  59.86861        57.90
## 2016-12-29 38.64     62.90  59.21050        57.42
## 2016-12-30 38.67     62.14  59.26035        57.22
```

## Los datos
El primer archivo contiene los precios de acciones diarios de cuatro importantes compañías: Yahoo, Microsoft, Citigroup y Dow Chemical en el periodo enero-2015 a diciembre 2016. A continuación se presentan las series de tiempo para cada compañía contrastando los precios vs las fechas.

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo1-1.png" alt="Gráfica_1"  />
<p class="caption">Gráfica_1</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo2-1.png" alt="Gráfica_2"  />
<p class="caption">Gráfica_2</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo3-1.png" alt="Gráfica_3"  />
<p class="caption">Gráfica_3</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo4-1.png" alt="Gráfica_4"  />
<p class="caption">Gráfica_4</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo5-1.png" alt="Gráfica_5"  />
<p class="caption">Gráfica_5</p>
</div><div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo5-2.png" alt="Gráfica_5"  />
<p class="caption">Gráfica_5</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo6-1.png" alt="Gráfica_6"  />
<p class="caption">Gráfica_6</p>
</div><div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo6-2.png" alt="Gráfica_6"  />
<p class="caption">Gráfica_6</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo7-1.png" alt="Gráfica_7"  />
<p class="caption">Gráfica_7</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo8-1.png" alt="Gráfica_8"  />
<p class="caption">Gráfica_8</p>
</div>
<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo9-1.png" alt="Gráfica_9"  />
<p class="caption">Gráfica_9</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo10-1.png" alt="Gráfica_10"  />
<p class="caption">Gráfica_10</p>
</div>


```
## [1] "Index" "Apple"
```

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo11-1.png" alt="Gráfica_11"  />
<p class="caption">Gráfica_11</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo12-1.png" alt="Gráfica_12"  />
<p class="caption">Gráfica_12</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/pedazo13-1.png" alt="Gráfica_13"  />
<p class="caption">Gráfica_13</p>
</div>


```
## [1] "xts" "zoo"
```











