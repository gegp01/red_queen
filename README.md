Currently humanity is dealing with an evoltionary arm race against the novel coronavirus SARS-CoV-2, that have caused human suffering and 5 million deaths worldwide by Covid-19. In this race, regulating our mobility, using face masks and vaccination have been key in controlling the daily increase of Covid-19 cases. However restricting mobility has costs on household economy and wellbeing. 

This repository contains algorithms written in R that decompose time series of daily Covid-19 cases, and mobility data from mobile devices. Together the algorithms update and compile data from 5 mtropolitan areas (New York US, Greater London UK, Sao Paulo Brazil, Mexico city, and Santiago de Chile). Then, Bayesian statistics and machine learning are used to find the mobility events from the past that explain the increase in daily cases of Covid-19, within a time interval.

<h3>Index</h3>

Note: 

<ul>
  <li>Before running the algorithms data must be gathered from oficial sources in a localhost.
  <ul>
    <li> Download the Global Mobility Report from <a href = "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv" target="_blank"> Googgle </a> and save it in a local directory</li>
    <li>Download data from <a href= "https://www.gob.mx/salud/documentos/datos-abiertos-152127" target="_blank">Dirección General de Epidemiología en México</a>, and rename the csv data file as covid_mx.csv.</li>
   </ul></li>
  <li>Open a R terminal:
    <ul>
      <li>Define path to the directory were the data files are stored, <i>path="path to working directory"</i></li>
      <li>Define path to DGE data: path2covid_mx= "path to covid_mx/"</li>    
      <li>Run compilers of the time series.
        <ul>
          <li><i>Mobility time series</i>:source("https://gegp01.github.io/red_queen/1_mobility_data_compiler.R")</li>
          <li><i>Covid-19 time series</i>: source("https://gegp01.github.io/red_queen/2_covid19_data_compiler.R")</i></li>
      Time series will be stored in path.
        </ul>
       <li><i>Clear data from environment</i></li>
       <li><i>Read time series</i>: source("https://gegp01.github.io/red_queen/3_read_time_series.R")</li>
        </ul>
  </li>   
 </ul>
 
