
f.prediction = function(i_){
  o = X[as.character(d)]
  o = o[sort(names(o))]
  o_ = as.Date(0:29, as.Date(names(o[i_])))
  serie1 = X[as.character(o_)]
  x = serie1 > u[as.character(names(o[i_]))]
  
  t.incr = delay[as.character(names(o[i_]))]
  prediction = as.Date(names(x[x==T]))+t.incr
  as.character(prediction)
  }

w = unlist(lapply(1:length(d), f.prediction))


par(mai=c(1,1,1,1))
plot(Y~as.Date(names(Y)), axes = F, ylab = "Covid 19 cases", xlab =""
     , xlim=c(as.Date(-300, origin = "2021-01-01"),"2022-01-01"), type="l")
points(Y[as.character(w)]~as.Date(w), col="red")

# PRUEBAS DE PRECISION
pred_ = round(table(Z[w]>0)[2]/sum(table(Z[w]>0)), 2)
null_ = round(table(Z>0)[2]/sum(table(Z>0)), 2)

legend("topleft", c("daily cases", "mobility", "increase predicted"), box.lwd=0, cex = 0.7
       , inset = 0.05, lty=c("solid", "dotted", NA), pch = c(NA,NA,1), col = c("black", "blue", "red"), bg = "transparent")

legend("top", legend = c(paste("predictor:", pred_), paste("null:", null_))
       , box.lwd=0, cex = 0.7, bg = "transparent", title = "Accuracy", title.adj = 0.3)

axis(1, at=as.Date(names(Y)), labels = names(Y), las = 2, cex.axis = 0.5, lwd.ticks = 0.1)
axis(2, las = 2, cex.axis = 0.7)

