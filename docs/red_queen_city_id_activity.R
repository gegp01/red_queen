# Choose multiphasic-matrix to analyse:
city = paste(city_id, "_WORK", sep="") # Name to be used in the results file
Y = WORK # hay tres opciones: WORK, RECREO, RESIDENCE, CASOS, COVID (variable de cambio)
series = Q[[grep("covid_", names(Q))]] # covid es la variable de respuesta (cambio en casos diarios) se puede cambiar a casos, etc.
source("https://gegp01.github.io/red_queen/5_Bayes_partitions.R")

# Choose multiphasic-matrix to analyse:
city = paste(city_id, "_RECREO", sep="") # Name to be used in the results file
Y = RECREO # hay tres opciones: WORK, RECREO, RESIDENCE, CASOS, COVID (variable de cambio)
series = Q[[grep("covid_", names(Q))]] # covid es la variable de respuesta (cambio en casos diarios) se puede cambiar a casos, etc.
source("https://gegp01.github.io/red_queen/5_Bayes_partitions.R")
