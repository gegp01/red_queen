# DATA IS COLLECTED FROM SEVERAL SOURCES AND COMPILED IN THE FILE DEFINED AT A path DEFINED BY THE USER.

# 1. COVID19 IN NEW YORK
# Collect data from USA
COVID_USA = read.csv('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv')
str(COVID_USA)

# Estimate daily accumulated cases 
nyc = COVID_USA[grep("New York", COVID_USA$state),]

N_t0 = c(NA, nyc$cases)
N_t1 = c(nyc$cases, NA)
N = N_t1 - N_t0

# Estimate data on daily cases
covid_ny = N[-1] # ELIMINAMOS EL PRIMER VALOR, PUES NO SABEMOS CUANTOS HABIA EL DIA ANTERIOR (t_0)
names(covid_ny) = as.Date(nyc$date)


# 2. COVID19 IN GREATER LONDON (UNITED KINGDOM)
# ref: 
# gl = read.csv("https://data.london.gov.uk/download/coronavirus--covid-19--cases/0215c9bb-18f0-440c-a8d6-a44106ec55cd/ons_infection_survey.csv")
cases.age.london = read.csv("https://data.london.gov.uk/download/coronavirus--covid-19--cases/d15e692d-5e58-4b6e-80f2-78df6f8b148b/phe_cases_age_london.csv")
X = aggregate(cases.age.london$cases, list(cases.age.london$date), sum)
names(X) = c("date", "cases")
covid_london = X$cases
names(covid_london) = X$date

# 3. COVID19 IN SANTIAGO CITY (CHILE)
# Datos oficiales por region.
# https://e.infogram.com/79acdebc-18ad-4399-8936-bce3b3a49068?parent_url=https%3A%2F%2Fwww.gob.cl%2Fcoronavirus%2Fcifrasoficiales%2F&src=embed#
# NOTA: LOS DATOS DEBEN BAJARSE MANUALMENTE DEBIDO A LA ESTRUCTURA DE LOS DATOS
covid_chile = read.csv("~/Downloads/Region.csv")
chile_dates = covid_chile[,"Region"]
year.1 = rep(2020, grep("31-Dic", chile_dates)[1])
year.2 = rep(2021, length(chile_dates)-grep("31-Dic", chile_dates)[1])
year = c(year.1, year.2)
Xdates = paste(chile_dates, year, sep="-")

# FIX NAMES ON DATE FORMAT
x1 = gsub("Ene", "01", Xdates)
x2 = gsub("Feb", "02", x1)
x3 = gsub("Mar", "03", x2)
x4 = gsub("Abr", "04", x3)
x5 = gsub("May", "05", x4)
x6 = gsub("Jun", "06", x5)
x7 = gsub("Jul", "07", x6)
x8 = gsub("Ago", "08", x7)
x9 = gsub("Sep", "09", x8)
x10 = gsub("Oct", "10", x9)
x11 = gsub("Nov", "11", x10)
x12 = gsub("Dic", "12", x11)

covid_santiago = covid_chile[,"Metropolitana"]*70 # Los datos son: casos/100 000, en una poblacion de 7 millones (region metropolitana en 2017)
names(covid_santiago) = as.Date(x12, format="%d-%m-%Y")

################
# 4. COVID19 IN SAO PAULO (BRAZIL) 
# referencia: https://github.com/seade-R/dados-covid-sp
covid_brazil = read.csv("https://raw.githubusercontent.com/seade-R/dados-covid-sp/master/data/dados_covid_sp.csv", sep=";")

br = covid_brazil[covid_brazil$nome_ra=="RM de São Paulo",]
br2 = aggregate(br$casos_novos, list(br$datahora), sum)

covid_saopaulo = br2$x
names(covid_saopaulo) = as.Date(br2$Group.1)


# 5. COVID19 IN MEXICO CITY
covid=read.csv(paste(path2covid_mx, "DGE_data.csv", sep=""), stringsAsFactors=FALSE, colClasses=c(rep("character", 40)))
covid_cdmx=  covid[covid$ENTIDAD_RES == "09",]

# date = "FECHA_SINTOMAS"
covid_cdmx_antigeno = ifelse(covid_cdmx$RESULTADO_ANTIGENO==1, 1, 0)
covid_cdmx_lab = ifelse(covid_cdmx$RESULTADO_LAB==1, 1, 0)

positivo = ifelse(covid_cdmx_antigeno+covid_cdmx_lab > 0, TRUE, FALSE)
covid_cdmx_positivo = covid_cdmx[positivo==T,]

# Compile data on Covid for the cities of interest
M = list(cases_ny = covid_ny
         , cases_cdmx = table(covid_cdmx_positivo$FECHA_SINTOMAS)
         , cases_london = covid_london
         , cases_saopaulo = covid_saopaulo
         , cases_santiago = covid_santiago)

saveRDS(M, paste(path, "covid_time_series.rds", sep=""))
