# This scritpt will take the estimated thresholds of mobility and make predictions for the next 30 days, from the date of origin (used for etimating the threshold).
# A threshold was estimated every first day of each month, within a -30 day time interval to find the delay.

# Requirements:

path("path to files with time series generated at compilers 1 and 2")
setwd(path)

# read files and estimate response variables
source("https://gegp01.github.io/red_queen/3_read_time_series_cases_and_deaths.R")


# Start
path2results("path to output files")

nms.files = list.files(path2results) # read files in path2results
nms.predict = nms.files[grep("best", nms.files)]
f.files.pred = function(x){
  read.csv(paste(path2results, nms.predict[x], sep=""))
}

Z.pred = lapply(1:length(nms.predict), f.files.pred)
P = do.call(rbind, Z.pred)


# Set index of dates to be analysed (d)
d = as.Date(c("2021-08-01"
              , "2021-07-01"
              , "2021-06-01"
              , "2021-05-01"
              , "2021-04-01"
              , "2021-03-01"
              , "2021-02-01"
              , "2021-01-01"
              , "2020-12-01"
              , "2020-04-15" # New York's coronavirus mask order by Gov. Andrew Cuomo. Reports suggests a decrease in cases 2 days after!
              , "2020-11-01"
              , "2020-10-01"
              , "2020-09-01"
              , "2020-08-01"
              , "2020-07-01"
              , "2020-06-01"
              , "2020-05-01"))


################# PREDICTION ALGORITHM
# RECREO
############# PREDICT NEW YORK recreo
o = NY$recreo_ny_nona[as.character(d)]
o = o[sort(names(o))]

u = P$mobility[P$city =="NY_RECREO"] # umbral
names(u) = P$date_origin[P$city =="NY_RECREO"]

i_ = 1

o_ = as.Date(0:30, as.Date(names(o[i_])))
serie1 = NY$recreo_ny_nona[as.character(o_)]
serie2_ = NY$cases_ny[names(serie1)] # serie a predecir

serie2 = as.vector(serie2_)
names(serie2) = names(serie2_)

#########################################






