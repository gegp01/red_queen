# REQUISITOS: DEFINIR LA CIUDAD, p.ej. Q = LON; el periodo a analizar (n) y las fechas en d e ix.

############ NEW FUNCTIONS WITH idx
############ FUNCTIONS
f.intervalo = function(x){-1*(c(n:1) + x-2)} # Determinar el intervalo de tiempo que se analiza: p. ej. 30 dias = c(1:30)
intervalo = lapply(1:n, f.intervalo)

w = do.call(rbind, intervalo)
nms = paste("t", 0:(n-1), sep="")
rownames(w)<- nms

# write.csv(w, "intervalo.csv")

f.time = function(x){
  as.Date(intervalo[[x]], origin=d[ix]) # CAMBIAR ESTE NUMERO PARA HACER LAS FECHAS QUE SIGUEN!
}

time=lapply(1:length(intervalo), f.time)

#t1 = time[length(time):1] # secuencia invertida de tiempo para utlizarla como indice
f.var = function(x){serie[as.character(time[[x]])]}

serie = Q[[grep("work", names(Q))]]
WORK = data.frame(lapply(1:n, f.var))
names(WORK) = paste("t", 0:(n-1), sep="_")

serie = Q[[grep("recreo", names(Q))]]
RECREO = data.frame(lapply(1:n, f.var))
names(RECREO) = paste("t", 0:(n-1), sep="_")

serie = Q[[grep("residence", names(Q))]]
RESIDENCE = data.frame(lapply(1:n, f.var))
names(RESIDENCE) = paste("t", 0:(n-1), sep="_")

serie = Q[[grep("covid", names(Q))]]
COVID = data.frame(lapply(1:n, f.var))
names(COVID) = paste("t", 0:(n-1), sep="_")

serie = Q[[grep("cases", names(Q))]]
CASOS = data.frame(lapply(1:n, f.var))
names(CASOS) = paste("t", 0:(n-1), sep="_")
