Currently humanity is dealing with an evoltionary arm race against the novel coronavirus SARS-CoV-2, that have caused human suffering and 5 million deaths worldwide by Covid-19. In this race, regulating our mobility, using face masks and vaccination have been key in controlling the daily increase of Covid-19 cases. However restricting mobility has costs on household economy and wellbeing. 

This repository contains algorithms written in R that decompose time series of daily Covid-19 cases, and mobility data from mobile devices. Together the algorithms update and compile data from 5 mtropolitan areas (New York US, Greater London UK, Sao Paulo Brazil, Mexico city, and Santiago de Chile). Then, Bayesian statistics and machine learning are used to find the mobility events from the past that explain the increase in daily cases of Covid-19, within a time interval.

<h3>Index</h3>

Note: 

<ul>
  <li>Time series for each of the cities analysed have been copiled in 2 files: One with daily mobility another with daily cases of Covid-19. <br> These data can be downloaded an read by the algorithm (3). More details about the source and compilation can be found here: XX </li>
  <!--li>Before running the algorithms data must be gathered from oficial sources in a localhost.
  <ul>
    <li> Download the Global Mobility Report from <a href = "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv" target="_blank"> Goggle </a> and save it in a local directory</li>
    <li>Download data from <a href= "https://www.gob.mx/salud/documentos/datos-abiertos-152127" target="_blank">Dirección General de Epidemiología en México</a>, and rename the csv data file as covid_mx/DGE_data.csv.</li>
    <li>Download data manually from Santiago de Chile: https://e.infogram.com/79acdebc-18ad-4399-8936-bce3b3a49068?parent_url=https%3A%2F%2Fwww.gob.cl%2Fcoronavirus%2Fcifrasoficiales%2F&src=embed#</li> (Save data in path)
   </ul></li-->
  <li>Open a R terminal:
    <!--ul>
      <li><i>Define path to the directory were the data files are stored</i>, <b>path="path to working directory"</b></li>
      <li><i>Define path to DGE data</i>: <b>path2covid_mx= "path to covid_mx/"</b></li>    
      <li><i>Run compilers of the time series and these will be saved in path</i>.
        <ul>
          <li><i>Mobility time series</i>:source("https://gegp01.github.io/red_queen/1_mobility_data_compiler.R")</li>
          <li><i>Covid-19 time series</i>: source("https://gegp01.github.io/red_queen/2_covid19_data_compiler.R")</i></li>
        </ul>
       <li><i>Clear data from environment</i></li-->
       <li><i>Read time series</i>: source("https://gegp01.github.io/red_queen/3_read_time_series.R")</li>
       <li><i>Run all the analyses</i><br>
         <ul>
           <li>New York <br> <b>source("https://gegp01.github.io/red_queen/red_queen_NY.R")</b></li>
           <li>Greater London <br> <b>source("https://gegp01.github.io/red_queen/red_queen_LONDON.R")</b></li>
           <li>Mexico City <br> <b>source("https://gegp01.github.io/red_queen/red_queen_CDMX.R")</b></li>
           <li>Sao Paulo Brazil <br> <b>source("https://gegp01.github.io/red_queen/red_queen_SAOPAULO.R")</b></li>
           <li>Santiago de Chile <br> <b>source("https://gegp01.github.io/red_queen/red_queen_SANTIAGO.R")</b></li>
         </ul>
       <li> 
  </ul>
