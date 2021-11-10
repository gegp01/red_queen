# Grafica
plot.new()
lines(c(0.18, 0.4),c(0.74, 0.9), lty="dashed", lwd=2)
lines(c(0.18, 0.4),c(0.74, 0.5), lty="dashed", lwd=2)

lines(c(0.8, 0.48),c(0.63, 0.45), lty="dashed", lwd=2)
lines(c(0.8, 0.48),c(0.2, 0.45), lty="dashed", lwd=2)

# PARTITION_1 paste("daily relative cases \n in", n, "days \n"),
legend(0, 0.8, legend=c("increase", "no increase"), col=c("red", "blue"), pch=19, bg = "azure"
       , title= NULL, box.col="black")
text(0.1, 0.6, paste("daily relative cases \n within", n, "days, \n before", d[ix]), cex=0.8)


# PARTITION_1

#legend(0.4, 1, legend=c(si_C_1, si_noC_1), pch=19, col=c("red", "blue"), bg = "azure", title = paste("mobility  \n > ", round(partition_1[1], 2), "%", sep=""), box.col="black")
legend(0.4, 1, legend=c(si_C_1, si_noC_1), pch=19, col=c("red", "blue"), bg = "azure", title = NULL, box.col="black")
legend(0.4, 0.5, legend=c(no_C_1, no_noC_1), pch=19, col=c("red", "blue"), bg = "azure", title =NULL, box.col="black")

# PARTITION_2
#legend(0.8, 0.73, legend=c(si_C_2, si_noC_2), pch=19, col=c("red", "blue"), bg = "azure", title = paste("mobility \n > ", round(partition_2[1], 2), "%", sep=""), box.lty = 1)
legend(0.8, 0.73, legend=c(si_C_2, si_noC_2), pch=19, col=c("red", "blue"), bg = "azure", title = NULL, box.lty = 1)
legend(0.8, 0.2, legend=c(no_C_2, no_noC_2), pch=19, col=c("red", "blue"), bg = "azure", title = NULL, box.lty = 1)

#legend("bottomleft", legend=c("delay in days", paste(delay_1[1], d[1]-as.numeric(delay_1)), paste(delay_2[1], d[1]-as.numeric(delay_2))), col=c("transparent"), pch=19, box.lty = 0, title=d[1])

text(0.9,0.55,  paste("mobility > ", round(partition_2[1], 2), "% \n"
                     , delay_2[1], "days before \n in", d[ix]-as.numeric(delay_2[1]), "\n score:", round(score_table_2[names(partition_2[1]),"score"], 2))
                     , cex = 0.8)

#text(0.85,0.45, paste(delay_2[1], "days delay: \n", d[ix]-as.numeric(delay_2[1]), "\n score:", round(score_table_2[names(partition_2[1]),"score"], 2)), cex=0.8)

text(0.5, 0.81, paste("mobility > ", round(partition_1[1], 2), "% \n"
                     , delay_1[1], "days before \n in", d[ix]-as.numeric(delay_1[1]), "\n score:", round(score_table_1[names(partition_1[1]),"score"], 2))
     , cex = 0.8)
