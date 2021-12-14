# load function f.1_ from github
source("https://gegp01.github.io/red_queen/thresholds_predictions.R")

u = P$mobility[P$city =="NY_RECREO"] # umbral
names(u) = P$date_origin[P$city =="NY_RECREO"]
X = NY$recreo_ny_nona
Y = NY$cases_ny

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="New York", font.main=3)

########### New York work
# UMBRALES
u = P$mobility[P$city =="NY_WORK"] # umbral
names(u) = P$date_origin[P$city =="NY_WORK"]

# DATOS (SERIES DE TIEMPO)
X = NY$work_ny_nona
y = NY$cases_ny
Y = y
names(Y) = names(y)

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% mobility at work \n as predictor")

title(main="New York", font.main=3)


########### Mexico recreo
u = P$mobility[P$city =="CDMX_RECREO"] # umbral
names(u) = P$date_origin[P$city =="CDMX_RECREO"]
X = CDMX$recreo_cdmx_nona
y = CDMX$cases_cdmx
Y = y
names(Y) = names(y)

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="Mexico City", font.main=3)

########### Mexico work
# UMBRALES
u = P$mobility[P$city =="CDMX_WORK"] # umbral
names(u) = P$date_origin[P$city =="CDMX_WORK"]

# DATOS (SERIES DE TIEMPO)
X = CDMX$work_cdmx_nona
y = CDMX$cases_cdmx
Y = y
names(Y) = names(y)

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% mobility at work \n as predictor")

title(main="Mexico City", font.main=3)

########### Sao Paulo recreo
# UMBRALES
u = P$mobility[P$city =="SAOPAULO_RECREO"] # umbral
names(u) = P$date_origin[P$city =="SAOPAULO_RECREO"]

# DATOS (SERIES DE TIEMPO)
X = SAO$work_saopaulo_nona
Y = SAO$cases_saopaulo

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="Sao Paulo", font.main=3)

########### Sao Paulo work
# UMBRALES
u = P$mobility[P$city =="SAOPAULO_WORK"] # umbral
names(u) = P$date_origin[P$city =="SAOPAULO_WORK"]

# DATOS (SERIES DE TIEMPO)
X = SAO$work_saopaulo_nona
Y = SAO$cases_saopaulo

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% mobility at work \n as predictor")

title(main="Sao Paulo", font.main=3)


########### Santiago de Chile recreo
# UMBRALES
u = P$mobility[P$city =="SANTIAGO_RECREO"] # umbral
names(u) = P$date_origin[P$city =="SANTIAGO_RECREO"]

# DATOS (SERIES DE TIEMPO)
X = SAN$work_santiago_nona
Y = SAN$cases_santiago

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="Santiago de Chile", font.main=3)

########### Santiago de Chile work
# UMBRALES

u = P$mobility[P$city =="SANTIAGO_WORK"] # umbral
names(u) = P$date_origin[P$city =="SANTIAGO_WORK"]

# DATOS (SERIES DE TIEMPO)
X = SAN$work_santiago_nona
Y = SAN$cases_santiago

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="Santiago de Chile", font.main=3)

########### London recreo
# UMBRALES
u = P$mobility[P$city =="LONDON_RECREO"] # umbral
names(u) = P$date_origin[P$city =="LONDON_RECREO"]

# DATOS (SERIES DE TIEMPO)
X = LON$work_london_nona
Y = LON$cases_london

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="London", font.main=3)

########### Santiago de Chile recreo
# UMBRALES

u = P$mobility[P$city =="LONDON_WORK"] # umbral
names(u) = P$date_origin[P$city =="LONDON_WORK"]

# DATOS (SERIES DE TIEMPO)
X = LON$work_london_nona
Y = LON$cases_london

W = do.call(rbind, lapply(c(1:length(d)), f.i_))
plot(W$daily.cases~as.Date(W$day), col="darkslategrey"
     , type = "l", axes=F, xlab= "", ylab="daily cases of Covid-19")
points(W$daily.cases~as.Date(W$day), col=W$paleta)
axis(1, labels=W$day, at=as.Date(W$day), las=2, cex.axis = 0.7)
axis(2)

legend("topleft", inset=0.05, legend= c("increase predicted", "no prediction")
       , pch = 1, col=c("red", "blue"), box.lwd = 0, bg = "transparent"
       , title="% leisure mobility \n as predictor")

title(main="London", font.main=3)

