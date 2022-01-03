# This algorithm will perform Bayes partition on the correlations of time series for each city in the analysis 

# 1. Define path, dates to use as origin, and window length.
setwd(path)

# 2. Read time series
source("https://gegp01.github.io/red_queen/3_read_time_series_cases_and_deaths.R")

# 3. Define dates to be used as origin. The algorithm will scan the time series X from the date of origin (d[ix])
# , towards the past for n days.
d = as.Date(c("2021-12-01"
              , "2021-11-01"
              , "2021-10-01"
              , "2021-09-01"
              , "2021-08-01"
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
# 4. Determine the window length in days (n) to scan the time series
n = 30

# 5. Run analysis
# 5.1 Determine path to results: path2results

# 5.2 Define the city:
Q = SAO # Code name of the city as in the time series (NY, LON, CDMX, SAO, SAN)
city_id= "SAOPAULO"

#PROBAR DISTINTOS ix
ix = 1# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 2# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 3# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 3# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 4# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 5# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 6# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 7# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 8# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 9# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 10# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 11# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 12# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 13# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 14# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 15# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 16# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 17# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 18# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 19# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 20# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")

####
ix = 21# d[ix] es la fecha de origen para la serie de tiempo a analizar. solo funciona desde "2020-05-01"
source("https://gegp01.github.io/red_queen/4_matrices_desfase.R")
source("https://gegp01.github.io/red_queen/red_queen_city_id_activity.R")


######################################
