Currently humanity is dealing with an evoltionary arm race against the novel coronavirus SARS-CoV-2, that have caused human suffering and 5 million deaths worldwide by Covid-19. In this race, regulating our mobility, using face masks and vaccination have been key in controlling the daily increase of Covid-19 cases. However restricting mobility has costs on household economy and wellbeing. 

This repository contains algorithms written in R that decompose time series of daily Covid-19 cases, and mobility data from mobile devices. Together the algorithms update and compile data from 5 mtropolitan areas (New York US, Greater London UK, Sao Paulo Brazil, Mexico city, and Santiago de Chile). Then, Bayesian statistics and machine learning are used to find the mobility events from the past that explain the increase in daily cases of Covid-19, within a time interval.

<h3>Index</h3>

Note: 

<ul>
  <li>Before running the algorithms data must be gathered from oficial sources in a localhost.
  <ul>
    <li> Download the Global Mobility Report from <a href = "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv" target="_blank"> Googgle </a> and save it in a local directory</li>
    <li>Download data from <a href= "https://www.gob.mx/salud/documentos/datos-abiertos-152127" target="_blank">Dirección General de Epidemiología en México</a>, and rename the csv data file as covid_mx/DGE_data.csv.</li>
   </ul></li>
  <li>Open a R terminal:
    <ul>
      <li><i>Define path to the directory were the data files are stored</i>, <b>path="path to working directory"</b></li>
      <li><i>Define path to DGE data</i>: <b>path2covid_mx= "path to covid_mx/"</b></li>    
      <li><i>Run compilers of the time series and these will be saved in path</i>.
        <ul>
          <li><i>Mobility time series</i>:source("https://gegp01.github.io/red_queen/1_mobility_data_compiler.R")</li>
          <li><i>Covid-19 time series</i>: source("https://gegp01.github.io/red_queen/2_covid19_data_compiler.R")</i></li>
        </ul>
       <li><i>Clear data from environment</i></li>
       <li><i>Read time series</i>: source("https://gegp01.github.io/red_queen/3_read_time_series.R")</li>
       <li>Make a list of the dates to be investigted:<i><br><b>
         d = as.Date(c("2021-08-01"
              , "2021-07-01"
              , "2021-06-01"
              , "2021-05-01"
              , "2021-04-01"
              , "2021-03-01"
              , "2021-02-01"
              , "2021-01-01"
              , "2020-12-01"
              , "2020-04-15"
              , "2020-11-01"
              , "2020-10-01"
              , "2020-09-01"
              , "2020-08-01"
              , "2020-07-01"
              , "2020-06-01"
              , "2020-05-01"
              , "2020-04-01"
              , "2020-03-01"
              , "2020-02-01")
         )</b> 
          <br></li>
          <li><i>Define n, the number of days of the time interval to be analized.</i><br>
            <b>n = 30</b>
  </li>
  <li> <i> Change paremeters of the analysis at will:</i><br>
    <b>path2results = "path to the directory where results will be stored"</b> <br>
    <b>Q = NY</b> # The acronym of the city to analyse: New York (NY), Greater London (LON), Ssao Paulo (SAO), Mexico city (CDMX) or Santiago (SAN). <br>
    <b>city = "NY_RECREO"</b> # name of the city and the mobility variable of interest. <br>
    <b>ix = 1 </b> # A number of the date to be investigated, d[ix] is the date.<br>
    <b>Y = RECREO </b> # choose either mobility at working places (WORK), or mobility at recreational places (RECREO) <br> 
    <b>series = Q[[grep("covid", names(Q))]] </b> # name of the series to analyse: "covid" is the increase in daily cases (N_t - N_(t-1))
    <br><i>Run the analysis:</i>
    source("https://gegp01.github.io/red_queen/5_Bayes_partitions.R")
  </li>
        </ul>
        <br> For each date (ix) and other parameters used, the output will store 4 csv files: Score table for partition 1 and 2 (score_table_1 and score_table_2); coss validation values; and a summary of the best predictors.  
  </li>   
 </ul>
