################# PREDICT
# RECREO
############# PREDICT NEW YORK recreo
# Example
# o = NY$recreo_ny_nona[as.character(d)]
# o = o[sort(names(o))]
#
# u = P$mobility[P$city =="NY_RECREO"] # umbral
# names(u) = P$date_origin[P$city =="NY_RECREO"]
# X = NY$recreo_ny_nona
# Y = NY$cases_ny
# i_ = 1
#########################

f.i_ = function(i_){
  o = X[as.character(d)]
  o = o[sort(names(o))]
  o_ = as.Date(0:30, as.Date(names(o[i_])))
  serie1 = X[as.character(o_)]
  serie2_ = Y[names(serie1)] # serie a predecir
  serie2 = as.vector(serie2_)
  names(serie2) = names(serie2_)
  paleta=ifelse(serie1 >= u[as.character(names(o[i_]))], "red", "blue")
  data.frame(mobility = serie1, daily.cases=serie2, paleta)
  }
