# DEFINIR TIEMPOS DEL ANÁLISIS (el día 15 de cada mes)
d = as.Date(c(46, 75, 106, 136, 167,197,228,259, 289, 320, 350, 381, 412, 440, 471, 501, 532, 562, 593, 624), origin="2019-12-31")
n = 30 # dias de los fragmentos de series de tiempo a anlizar.

# Generar la variable de respuesta incrementos en covid.
Q = NY
ix = 3



source("~/COVID19_C3/SERIES DE TIEMPO/R/red_queen_function_NY_WORK.R")

title(main=paste("New York mobility at work \n before", d[ix]), font.main=3)

source("~/COVID19_C3/SERIES DE TIEMPO/R/red_queen_function_NY_RECREO.R")
title(main=paste("New York mobility at recreation \n before", d[ix]), font.main=3)

path= "~/COVID19_C3/SERIES DE TIEMPO/RESULTS/NY/RECREO/"
ix = 18 # SOLO SE PUEDE ANALIZAR DESDE EL TIEMPO d[3]
#  svg(filename=paste(path, d[ix], "-NY-WORK.svg", sep="")
  svg(filename=paste(path, d[ix], "-NY-RECREO.svg", sep="")
      , width=7 
      , height=7
      , pointsize=9)
#  source("~/COVID19_C3/SERIES DE TIEMPO/R/red_queen_function_NY_WORK.R")
  source("~/COVID19_C3/SERIES DE TIEMPO/R/red_queen_function_NY_RECREO.R")
 
# title(main=paste("Covid-19 and mobility at work in New York,", d[ix]), font.main=3)
  title(main=paste("Covid-19 and mobility at retail and recreation in New York,", d[ix]), font.main=3)
  dev.off()

X = do.call(rbind, lapply(1, f0))
X

path= "~/COVID19_C3/SERIES DE TIEMPO/RESULTS/NY/RECREO/"
write.csv(X, file=paste(path, d[ix], ".csv", sep=""))
