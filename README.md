Currently humanity is dealing with an evoltionary arm race against the novel coronavirus SARS-CoV-2, that have caused human suffering and 5 million deaths worldwide by Covid-19. In this race, regulating our mobility, using face masks and vaccination have been key in controlling the daily increase of Covid-19 cases. However restricting mobility has costs on household economy and wellbeing. 

This repository contains algorithms written in R that decompose time series of daily Covid-19 cases, and mobility data from mobile devices. Together the algorithms update and compile data from 5 mtropolitan areas (New York US, Greater London UK, Sao Paulo Brazil, Mexico city, and Santiago de Chile). Then, Bayesian statistics and machine learning are used to find the mobility events from the past that explain the increase in daily cases of Covid-19, within a time interval.

<h3>Index</h3>

Note: 

<ul>
  <li>Before running the algorithms data must be gathered from oficial sources in a localhost.
  <ul>
    <li> Download the Global Mobility Report from <a href = "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv"> Googgle </a> and save it in a local directory</li>
    <li>Download data from Dirección General de Epidemiología en México (), and rename the csv data file as covid_mx.csv.</li>
   </ul></li>
  <li>Run the data compilers of the time series.
 </ul>
 
