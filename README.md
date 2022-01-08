Currently humanity is dealing with the evolutionary arm race of the novel coronavirus SARS-CoV-2, that have caused human suffering and 5 million deaths worldwide by Covid-19. In this race, regulating our mobility, using face masks and vaccination have been key in controlling the daily increase of Covid-19 cases. However restricting mobility has costs on household economy and wellbeing. 

This repository contains algorithms written in R that decompose time series of daily Covid-19 cases, and mobility data from mobile devices. Together the algorithms update and compile data from 5 mtropolitan areas (New York US, Greater London UK, Sao Paulo Brazil, Mexico city, and Santiago de Chile). Then, Bayesian statistics and machine learning are used to find the mobility events from the past that explain the increase in daily cases of Covid-19, within a time interval.

<h3>Index</h3>

Note: 

<ul>
  <li>Time series for each of the cities analysed have been copiled in 2 files: <ul><li>Time series of daily mobility ("https://gegp01.github.io/red_queen/time_series_mobility.rds")</li><li> Time series of daily cases of Covid-19 ("https://gegp01.github.io/red_queen/covid_time_series.rds")</li></ul>

  <li>Open a R terminal:
  <li><i>Define <b>path = "full path where data is stored"</b></i></li>
  <li><i>Define <b>path2results = "full path where result will be stored"</b></i></li>
       <li><i>Read time series</i>:<br><b>source("https://gegp01.github.io/red_queen/3_read_time_series.R")</b></li>
  <li><b><i>Machine learning</i></b>. The following algorithms will estimate the parameters of delay between time series and the amount (%) of mobility that maximize the correlation between the time series of mobility and the time series of increases in daily cases of covid-19.<br>
         <ul>
           <li>New York <br> <b>source("https://gegp01.github.io/red_queen/red_queen_NY.R")</b></li>
           <li>Greater London <br> <b>source("https://gegp01.github.io/red_queen/red_queen_LONDON.R")</b></li>
           <li>Mexico City <br> <b>source("https://gegp01.github.io/red_queen/red_queen_CDMX.R")</b></li>
           <li>Sao Paulo Brazil <br> <b>source("https://gegp01.github.io/red_queen/red_queen_SAOPAULO.R")</b></li>
           <li>Santiago de Chile <br> <b>source("https://gegp01.github.io/red_queen/red_queen_SANTIAGO.R")</b></li>
         </ul>
       </li>
  <li><i><b>How well did the machine learn?</b></i> Once the estimated parameters are obtained, we analyse the data with sensible the statistics. For example, here we (1) analyse the cross-validation errors of our parameters to classify increases in covid-19 cases,  and (2) tested whether the parameters can predict future increments in covid-19 cases.  
  </ul>
