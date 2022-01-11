# This algorithm will perform Bayes partition on the correlations of time series for each city in the analysis 

# 1. Define path, dates to use as origin, and window length.
setwd(path)

# 2. Read time series in path
source("https://gegp01.github.io/red_queen/3_read_time_series_cases_and_deaths.R")

# 3 Define the city
Q = NY # Code name of the city as in the time series (NY, LON, CDMX, SAO, SAN)
city_id= "NY"

# 4. Run analysis at d dates, with n days window.
source("https://gegp01.github.io/red_queen/dix_RUN.R")
