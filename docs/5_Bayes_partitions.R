#Y = RESIDENCE 
#Y = RECREO
#Y = WORK
#Y = COVID
#Y = CASOS

#series = Q[["covid_ny"]]
#series = Q[["casos_ny"]]

# INICIA FUNCION DE APP 
Y$covid = series[rownames(Y)]

# Recursive partitioning with Bayes classifier (score)
# As a classifier we used score developed bu Stephens et al. 

# REQUIRES THE DATAFRAMEY (red_queen_covid.R)
Y0 = Y

# BAYESIAN CLASSIFIER
predictors = paste("t_", 1:(n-1), sep="")
#y = "mobility"
y = "covid"
# y = "C"

# Y = Y0 # first split bets.predictor: t_27; accuracy = 0.466, xerror = 0.533

f.classes = function(x){
  X = Y[, predictors]
#  p = ifelse(X[,x]>=quantile(X[,x], probs = (1:10)/10)[8], 1, 0)
  p = ifelse(X[,x]>quantile(X[,x], probs = (1:10)/10)[8], 1, 0)
  #  q = ifelse(Y[,y]>=quantile(Y[,y], probs = (1:10)/10)[9], 1, 0)
  q = ifelse(Y[,y]>=1, 1, 0) # para y = covid t /covid t-1
  paste(p,q)
}

Xn=lapply(1:length(predictors), f.classes)

names(Xn)= predictors

f.score = function(x){
  Xn=table(Xn[[x]])
  #  N_Xn_C = ifelse(is.na(Xn["1 1"])==F, Xn["1 1"], 0)
  #N_Xn_C = Xn["1 1"]
  N_Xn_C = ifelse(is.na(Xn["1 1"])==F, Xn["1 1"], 0)
  names(N_Xn_C) = "1 1"
  #  N_Xn_noC = Xn["1 0"]
  N_Xn_noC = ifelse(is.na(Xn["1 0"])==F, Xn["1 0"], 0)
  N_noXn_C = ifelse(is.na(Xn["0 1"])==F, Xn["0 1"], 0)
  
  N_C = sum(N_noXn_C, N_Xn_C)
  N_noXn_noC = ifelse(is.na(Xn["0 0"])==F, Xn["0 0"], 0)
  
  N_noC = sum(N_Xn_noC, N_noXn_noC)
  # N_noC = sum(Xn["1 0"], Xn["0 0"])
  
#  log((N_Xn_C/N_C)/(N_Xn_noC/N_noC))  # sumar 1 en la formula loc(x+1), para que nunca sea -Inf = log(0)
  log ((N_Xn_C+0.005 / N_C+0.01) / (N_Xn_noC+0.005 / N_noC+0.01)) # Corrección de Laplace. De otro modo, score = Inf, cuando el denominador es 0
  
}

score = unlist(lapply(1:length(predictors), f.score))

f.score.table = function(x){
  Xn=table(Xn[[x]])
  N_Xn_C = ifelse(is.na(Xn["1 1"])==F, Xn["1 1"], 0)
  names(N_Xn_C) = "1 1"
  #  N_Xn_C = Xn["1 1"]
  # N_Xn_noC = Xn["1 0"]
  N_Xn_noC = ifelse(is.na(Xn["1 0"])==F, Xn["1 0"], 0)
  N_noXn_C = ifelse(is.na(Xn["0 1"])==F, Xn["0 1"], 0)
  
  N_C = sum(N_noXn_C, N_Xn_C)
  #N_C = sum(Xn["0 1"], N_Xn_C)
  
  N_noXn_noC = ifelse(is.na(Xn["0 0"])==F, Xn["0 0"], 0)
  N_noC = sum(N_Xn_noC, N_noXn_noC)
  
#  score=log((N_Xn_C/N_C)/(N_Xn_noC/N_noC))
  score = log ((N_Xn_C+0.005 / N_C+0.01) / (N_Xn_noC+0.005 / N_noC+0.01)) # Corrección de Laplace. De otro modo, score = Inf, cuando el denominador es 0
  
  data.frame(N_Xn_C, N_Xn_noC, N_C, N_noC, score)
}

sapply(1:7, f.score.table)

score_table = lapply(1:length(predictors), f.score.table)
names(score_table) = predictors

score_table_1 = do.call(rbind, score_table)
#path_SCORE = "~/COVID19_C3/SERIES DE TIEMPO/RESULTS/"
#write.csv(score_table_1, paste(path_SCORE, "NY_", y, max(rownames(Y)), ".csv", sep=""))

best.predictor = Xn[predictors[score==max(na.omit(score))]]
best.predictor = best.predictor[is.na(names(best.predictor))==F]

p = na.exclude(predictors[score==max(na.omit(score))])
#p

f.quantile=function(x){
  quantile(Y[[p[x]]], probs = (1:10)/10)[8]
}

class_Xn = sapply(1:length(p), f.quantile)
names(class_Xn) = p

partition_1 = class_Xn

si_C_1 = table(Xn[p[1]])["1 1"]
si_noC_1 = table(Xn[p[1]])["1 0"]

no_noC_1 = table(Xn[p[1]])["0 0"]
no_C_1 = table(Xn[p[1]])["0 1"]


########################################################## 
##########################################################
#  SUBSETS in S

f.subset = function(x){
  Y_1 = Y[is.na(match(best.predictor[[x]], c("1 1", "1 0")))==F,] # LAS PREDICCIONES (1) CORRECTAS Y LOS ERRORES. (CLASSIFICADOS COMO 1, PERO EN LA NO CLASE (0).)
  Y_2 = Y[is.na(match(best.predictor[[x]], c("0 1", "0 0")))==F,] # LAS PREDICCIONES (0) CORRECTAS Y LOS ERRORES. (CLASSIFICADOS COMO 0, PERO EN LA CLASE (1).)
  list(Y_1, Y_2)
} 

S = sapply(1:length(best.predictor), f.subset)

row.names(S) = c("Y1", "Y2")
colnames(S) = names(best.predictor)


# analizar primera partición
# Y0 = Y # backup
Y = S[[2,1]] # Y2 
# Y = S[[1,1]]  # Y1

Xn=lapply(1:length(predictors), f.classes)
names(Xn)= predictors

score = unlist(lapply(1:length(predictors), f.score))

#sapply(7, f.score.table)
score_table = lapply(1:length(predictors), f.score.table)
names(score_table) = predictors
score_table_2 = do.call(rbind, score_table)

best.predictor = Xn[predictors[score==max(na.omit(score))]]
best.predictor = best.predictor[is.na(names(best.predictor))==F]

p = na.exclude(predictors[score==max(na.omit(score))])
#p

class_Xn = sapply(1:length(p), f.quantile)
names(class_Xn) = p

partition_2 = class_Xn

si_C_2 = table(Xn[p[1]])["1 1"]
si_noC_2 = table(Xn[p[1]])["1 0"]

no_noC_2 = table(Xn[p[1]])["0 0"]
no_C_2 = table(Xn[p[1]])["0 1"]

#score_table_1
#score_table_2  
#partition_1
#partition_2

delay_1 = gsub("t_", "", names(partition_1))
delay_2 = gsub("t_", "", names(partition_2))

#delay_1
#delay_2


# Cuadro resumen
best_1 = data.frame(partition_1[1], score = round(score_table_1[names(partition_1[1]),"score"], 2), delay_1, d[ix], d[ix]-as.numeric(delay_1), "part_1")
best_2 = data.frame(partition_2[1], score = round(score_table_2[names(partition_2[1]),"score"], 2), delay_2, d[ix], d[ix]-as.numeric(delay_2), "part_2")

names(best_1) = c("mobility", "score", "delay", "date_origin", "date_delay", "partition")
names(best_2) = c("mobility", "score", "delay", "date_origin", "date_delay", "partition")

BEST_PREDICTORS = rbind(best_1, best_2)

report= list(score_table_1
             score_table_2
             partition_1
             partition_2
             delay_1
             delay_2
             BEST_PREDICTORS)

report

#print(list(score_table_1 = score_table_1, score_table_2 = score_table_2, best_predictors = BEST_PREDICTORS))
