# RED QUEEN. The analysis requires two matrix capturing autocorrelation within the time series: one matrix for covid cases and another one for mobility

# INSTRUCCIONES PARA EL ANALISIS (5-nov-2021)

# Verificar que: 
# El código en github genera un archivo RDS (time_series_mobility.rds) con los datos de mobilidad laboral, de recreo y residencial
# para cada ciudad. Notar que los datos crudos deben estar en path.
# Definir directorio en el que se encuentran los datos crudos (descargados) de la DGE, cntenidos en covid_mx.csv

# 1. DESCARGAR LOS DATOS DE LA FUENTES ORIGINALES EN path = "~/COVID19_C3/SERIES DE TIEMPO/DATOS/"
# system("wget https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv")

# EN UNA TERMINAL DE LINUX:
# wget https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv

# 2. Compilar datos de movilidad.
path = ""
source("https://gegp01.github.io/red_queen/1_mobility_data_compiler.R")

# 3. Compilar series de tiempo de covid-19
# Verificar: Definir directorio en el que se encuentran los datos crudos (descargados) de la DGE, cntenidos en covid_mx.csv
path2covid_mx= "" 
source("https://gegp01.github.io/red_queen/2_covid19_data_compiler.R")

# LIMPÍAR EL AMBIENTE DE TODOS LOS ARCHIVOS!

# LAS SERIES DE TIEMPO ESTAN CONTENIDAS EN LAS LISTAS DE
# LONDRES (LON), NUEVA YORK (NY), CIUDAD DE MÉXICO (CDMX), SANTIAGO (SAN) Y SAO PAULO (SAO)

4. Análisis
# INPUT
# DETERMINAR LAS DECHAS DE INTERÉS PARA EL ESTUDIO EN CADA CIUDAD d
# Leer series de tiempo de los archivos en path y calcular la variable de respuesta para cada ciudad
setwd(path)
source("https://gegp01.github.io/red_queen/3_read_time_series.R")

# Espacio multifasico: GENERAR MATRICES DE LAS SERIES DE TIEMPO DE LONGITUD n 
# EMPEZANDO EN LA FECHA d[idx]

d = as.Date(c("2021-05-01"
              , "2021-04-01"
              , "2021-03-01"
              , "2021-02-01"
              , "2021-01-01"
              , "2020-12-01"
              , "2020-04-15" # New York's coronavirus mask order by Gov. Andrew Cuomo. Reports suggests a decrease in cases 2 days after!
              , "2020-04-30"
              , "2020-05-30"
              )  
            ) # fechas

n = 30 # dias de la serie de tiempo

# definir parametros: ciudad (Q), nombre del archivo (city), ix, path2results, {RECREO, WORK, RESIDENCE}, y series (variable de respuesta).

city = "LONDON_RECREO" # NOMBRE PARA EL LOS ARCHIVOS EN RESULTADOS
Q = LON # NY, LON, CDMX, SAO, SAN...
# Actualmente, solo se pueden analisis cada fecha seleccionada ix, 
# EJECUTAR EL ANÁLISIS DE PARTICION CON BASE EN EL SCORE
path2results = ""

#PROBAR DISTINTOS ix, d[ix]
ix = 9 # d[ix] es la fecha de origen para la serie de tiempo a analizar.
# Ejecutar el script para generar las matrices del espacio multifásico
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
Y = RECREO # hay tres opciones: WORK, RECREO, RESIDENCE, CASOS, COVID (variable de cambio)
series = Q[[grep("covid", names(Q))]] # covid es la variable de respuesta (cambio en casos diarios) se puede cambiar a casos, etc.

# Se generan 5 matrices con los parametros proporcionados: { WORK, RECREO, RESIDENCE, CASOS, COVID } 
source("https://gegp01.github.io/red_queen/5_Bayes_partitions.R")
