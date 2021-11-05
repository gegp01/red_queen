# RED QUEEN, the correlation between mobility and covid-19 cases
# The analysis requires two matrix capturing autocorrelation within the time series: one matrix for covid cases and another one for mobility, for each city

# DATOS DE MOVILIDAD DE GOOGLE. Set path to raw data
path

# UPDATE DATA # collect data @ https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv
google = read.csv(paste(path, "Global_Mobility_Report.csv", sep=""))

########################################################
# 1. Leer datos crudos, una vez descargados al path en localhost
########################################################

# Movilidad en New York 
gus = google[google["country_region_code"]=="US",] # datos de US
ny = gus[gus$sub_region_1=="New York",]

# Movilidad en Ciudad de México
gmx = google[google["country_region_code"]=="MX",] # datos de México
cdmx=gmx[gmx$sub_region_1=="Mexico City",]

# Movilidad en Delhi
gin = google[google["country_region_code"]=="IN",] # datos de India
delhi=gin[gin$sub_region_1=="Delhi",]

# Movilidad en Londres (Great London)
gb = google[google["country_region_code"]=="GB",] # datos de Great Britan
london=gb[gb$sub_region_1=="Greater London",]

# Movilidad en Buenos Aires
arg = google[google["country_region_code"]=="AR",] # datos de Argentina
buenosaires=arg[arg$sub_region_1=="Buenos Aires",]

# Movilidad en Santiago de Chile
chile = google[google["country_region_code"]=="CL",] # datos de Chile
santiago=arg[chile$sub_region_1=="Santiago Metropolitan Region",]

# Movilidad en Sao Paulo
brasil = google[google["country_region_code"]=="BR",] # datos de Chile
saopaulo=brasil[brasil$sub_region_1=="State of São Paulo",]

# Movilidad en Israel (first full vaccinated population)
# Israel = google[google["country_region_code"]=="IL",] # datos de Israel

####################################
# 2. Extraer mobilidad en distintas instancias: at work, recreation, and home
####################################
# MOBILITY AT WORKING PLACE
work_ny = ny[,"workplaces_percent_change_from_baseline"]
date_ny = as.character(ny[,"date"])
names(work_ny) = date_ny
work_ny_nona = na.exclude(work_ny)

work_cdmx = cdmx[,"workplaces_percent_change_from_baseline"]
date_cdmx = as.character(cdmx[,"date"])
names(work_cdmx) = date_cdmx
work_cdmx_nona = na.exclude(work_cdmx)

work_london = london[,"workplaces_percent_change_from_baseline"]
date_london = as.character(london[,"date"])
names(work_london) = date_london
work_london_nona = na.exclude(work_london)

work_saopaulo = saopaulo[,"workplaces_percent_change_from_baseline"]
date_saopaulo = as.character(saopaulo[,"date"])
names(work_saopaulo) = date_saopaulo
work_saopaulo_nona = na.exclude(work_saopaulo)

work_santiago = santiago[,"workplaces_percent_change_from_baseline"]
date_santiago = as.character(santiago[,"date"])
names(work_santiago) = date_santiago
work_santiago_nona = na.exclude(work_santiago)


# MOBILITY AT RECREATIONAL VENUES
recreo_ny = ny[,"retail_and_recreation_percent_change_from_baseline"]
date_ny = as.character(ny[,"date"])
names(recreo_ny) = date_ny
recreo_ny_nona = na.exclude(recreo_ny)

recreo_cdmx = cdmx[,"retail_and_recreation_percent_change_from_baseline"]
date_cdmx = as.character(cdmx[,"date"])
names(recreo_cdmx) = date_cdmx
recreo_cdmx_nona = na.exclude(recreo_cdmx)

recreo_santiago = santiago[,"retail_and_recreation_percent_change_from_baseline"]
date_santiago = as.character(santiago[,"date"])
names(recreo_santiago) = date_santiago
recreo_santiago_nona = na.exclude(recreo_santiago)

recreo_london = london[,"retail_and_recreation_percent_change_from_baseline"]
date_london = as.character(london[,"date"])
names(recreo_london) = date_london
recreo_london_nona = na.exclude(recreo_london)

recreo_saopaulo = saopaulo[,"retail_and_recreation_percent_change_from_baseline"]
date_saopaulo = as.character(saopaulo[,"date"])
names(recreo_saopaulo) = date_saopaulo
recreo_saopaulo_nona = na.exclude(recreo_saopaulo)


# MOBILITY AT RESIDENCES
residence_ny = ny[,"residential_percent_change_from_baseline"]
date_ny = as.character(ny[,"date"])
names(residence_ny) = date_ny
residence_ny_nona = na.exclude(residence_ny)

residence_cdmx = cdmx[,"residential_percent_change_from_baseline"]
date_cdmx = as.character(cdmx[,"date"])
names(residence_cdmx) = date_cdmx
residence_cdmx_nona = na.exclude(residence_cdmx)

residence_london = london[,"residential_percent_change_from_baseline"]
date_london = as.character(london[,"date"])
names(residence_london) = date_london
residence_london_nona = na.exclude(residence_london)

residence_santiago = santiago[,"residential_percent_change_from_baseline"]
date_santiago = as.character(santiago[,"date"])
names(residence_santiago) = date_santiago
residence_santiago_nona = na.exclude(residence_santiago)

residence_saopaulo = saopaulo[,"residential_percent_change_from_baseline"]
date_saopaulo = as.character(saopaulo[,"date"])
names(residence_saopaulo) = date_saopaulo
residence_saopaulo_nona = na.exclude(residence_saopaulo)


####################################################################
# 3. GUARDAR SERIES DE TIEMPO EN UN ARCHIVO RDS
###############################
saveRDS(list(work_ny_nona = work_ny_nona
             , recreo_ny_nona = recreo_ny_nona
             , residence_ny_nona = residence_ny_nona
             , work_cdmx_nona = work_cdmx_nona
             , recreo_cdmx_nona = recreo_cdmx_nona
             , residence_cdmx_nona = residence_cdmx_nona
             , work_london_nona = work_london_nona
             , recreo_london_nona = recreo_london_nona
             , residence_london_nona = residence_london_nona
             , work_santiago_nona = work_santiago_nona
             , recreo_santiago_nona = recreo_santiago_nona
             , residence_santiago_nona = residence_santiago_nona
             , work_saopaulo_nona = work_saopaulo_nona
             , recreo_saopaulo_nona = recreo_saopaulo_nona
             , residence_saopaulo_nona = residence_saopaulo_nona
             ), paste(path, "time_series_mobility.rds", sep=""))
