# Proceso utilizando las series de tiempo precargadas en un RDS

path= "~/COVID19_C3/SERIES DE TIEMPO/DATOS/"
setwd(path)
#Q = readRDS("time_series_ny.rds")

G = readRDS("time_series_mobility.rds")
C = readRDS("covid_time_series.rds")

# Mew York (region)
NY = list(cases_ny = C[["cases_ny"]]
          , work_ny_nona = G[["work_ny_nona"]]
          , recreo_ny_nona = G[["recreo_ny_nona"]]
          , residence_ny_nona = G[["residence_ny_nona"]])

# Ciudad de México
CDMX =  list(cases_cdmx = C[["cases_cdmx"]]
             , work_cdmx_nona = G[["work_cdmx_nona"]]
             , recreo_cdmx_nona = G[["recreo_cdmx_nona"]]
             , residence_cdmx_nona = G[["residence_cdmx_nona"]])

# Greater London
LON =  list(cases_london = C[["cases_cdmx"]]
             , work_london_nona = G[["work_london_nona"]]
             , recreo_london_nona = G[["recreo_london_nona"]]
             , residence_london_nona = G[["residence_london_nona"]])

# Region Metropolitana Santiago de Chile
SAN =  list(cases_santiago = C[["cases_santiago"]]
            , work_santiago_nona = G[["work_santiago_nona"]]
            , recreo_santiago_nona = G[["recreo_santiago_nona"]]
            , residence_santiago_nona = G[["residence_santiago_nona"]])

# Region de Sao Paulo, Brasil
SAO =  list(cases_saopaulo = C[["cases_saopaulo"]]
            , work_saopaulo_nona = G[["work_saopaulo_nona"]]
            , recreo_saopaulo_nona = G[["recreo_saopaulo_nona"]]
            , residence_saopaulo_nona = G[["residence_saopaulo_nona"]])

# VARIABLE DE RESPUESTA: Serie de tiempo de aumentos en contagios (> 0) con respecto al dia anterior
# Calcular la variable de respuesta (¿Aumento o decremento con respecto a ayer?): el cambio N_t / N_(t-1)
N_t0 = c(NA, NY[["cases_ny"]]) # Ciudad de México
N_t1 = c(NY[["cases_ny"]], NA)
# Y_ny = N_t1/(N_t0 + 1) # como no puede haber ceros en el    numerador, se suma 1.
Y_ny = N_t1-N_t0 # como no puede haber ceros en el    numerador, se suma 1.
covid_ny = na.exclude(Y_ny)

# Actualizar la lista de series de tiempo de New York
NY = list(cases_ny = C[["cases_ny"]]
          , work_ny_nona = G[["work_ny_nona"]]
          , recreo_ny_nona = G[["recreo_ny_nona"]]
          , residence_ny_nona = G[["residence_ny_nona"]]
          , covid_ny = covid_ny)

# Calcular la variable de respuesta (¿Aumentó con respecto a ayer?): el cambio N_t / N_(t-1)
N_t0 = c(NA, CDMX[["cases_cdmx"]]) # Ciudad de México
N_t1 = c(CDMX[["cases_cdmx"]], NA)
# Y_cdmx = N_t1/(N_t0 + 1) # como no puede haber ceros en el    numerador, se suma 1.
Y_cdmx = N_t1-N_t0 # Diferencia N_t1-N_t0
covid_cdmx = na.exclude(Y_cdmx)

CDMX =  list(cases_cdmx = C[["cases_cdmx"]]
             , work_cdmx_nona = G[["work_cdmx_nona"]]
             , recreo_cdmx_nona = G[["recreo_cdmx_nona"]]
             , residence_cdmx_nona = G[["residence_cdmx_nona"]]
             , covid_cdmx = covid_cdmx)

# Calcular la variable de respuesta (¿Aumentó con respecto a ayer?): el cambio N_t / N_(t-1)
N_t0 = c(NA, LON[["cases_london"]]) # London
N_t1 = c(LON[["cases_london"]], NA)
# Y_cdmx = N_t1/(N_t0 + 1) # como no puede haber ceros en el    numerador, se suma 1.
Y_london = N_t1-N_t0 # Diferencia N_t1-N_t0
covid_london = na.exclude(Y_london)

LON =  list(cases_london = C[["cases_london"]]
             , work_london_nona = G[["work_london_nona"]]
             , recreo_london_nona = G[["recreo_london_nona"]]
             , residence_london_nona = G[["residence_london_nona"]]
             , covid_london = covid_london)

# Calcular la variable de respuesta (¿Aumentó con respecto a ayer?): el cambio N_t / N_(t-1)
N_t0 = c(NA, SAO[["cases_saopaulo"]]) # Sao Paulo
N_t1 = c(SAO[["cases_saopaulo"]], NA)
# Y_cdmx = N_t1/(N_t0 + 1) # como no puede haber ceros en el    numerador, se suma 1.
Y_saopaulo = N_t1-N_t0 # Diferencia N_t1-N_t0
covid_saopaulo = na.exclude(Y_saopaulo)

SAO =  list(cases_saopaulo = C[["cases_saopaulo"]]
            , work_saopaulo_nona = G[["work_saopaulo_nona"]]
            , recreo_saopaulo_nona = G[["recreo_saopaulo_nona"]]
            , residence_saopaulo_nona = G[["residence_saopaulo_nona"]]
            , covid_saopaulo = covid_saopaulo)

# Calcular la variable de respuesta (¿Aumentó con respecto a ayer?): el cambio N_t / N_(t-1)
N_t0 = c(NA, SAN[["cases_santiago"]]) # Region Metropolitana (Santiago de Chile)
N_t1 = c(SAN[["cases_santiago"]], NA)
# Y_cdmx = N_t1/(N_t0 + 1) # como no puede haber ceros en el    numerador, se suma 1.
Y_santiago = N_t1-N_t0 # Diferencia N_t1-N_t0
covid_santiago = na.exclude(Y_santiago)

SAN =  list(cases_santiago = C[["cases_santiago"]]
            , work_santiago_nona = G[["work_santiago_nona"]]
            , recreo_santiago_nona = G[["recreo_santiago_nona"]]
            , residence_santiago_nona = G[["residence_santiago_nona"]]
            , covid_santiago = covid_santiago)
