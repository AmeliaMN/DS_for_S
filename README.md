## Data Science for Statisticians

Materials for the March 12, 2017 ENAR short course on data science for statisticians.
Amelia McNamara, Smith College
8 am - 5 pm

Abstract: As statistics becomes more computational and the term ‘data science’ is gaining traction, it is clear there are skills statisticians need to stay current. This short course will get you up to speed on many of the recent developments in this field. While there are many possible tools to use for data science, we will focus on the R ecosystem. Topics covered will include:

- Data visualization (ggplot2, see [Introduction](https://github.com/AmeliaMN/DS_for_S/tree/master/Introduction) folder)
- The tidyverse (dplyr, broom, tidyr, see [Introduction](https://github.com/AmeliaMN/DS_for_S/tree/master/Introduction) folder)
- APIs and web scraping (rvest, httr, see [Text](https://github.com/AmeliaMN/DS_for_S/tree/master/Text) folder)
- Version control (git and GitHub, see [Reproducibility](https://github.com/AmeliaMN/DS_for_S/tree/master/Reproducibility) folder)
- Reproducible research (RMarkdown and [Project TIER](http://www.projecttier.org/), see [Reproducibility](https://github.com/AmeliaMN/DS_for_S/tree/master/Reproducibility) folder)
- Finding help (StackOverflow, google, twitter, see [list of books and more](https://github.com/AmeliaMN/DS_for_S/blob/master/Cheatsheets%20and%20Resources/Books_and_more.md))
- Interactivity (shiny and leaflet, see [Shiny](https://github.com/AmeliaMN/DS_for_S/tree/master/Shiny) and [Geo](https://github.com/AmeliaMN/DS_for_S/tree/master/Geo) folders)

Participants should bring their own laptop with R and RStudio installed on it. Once you have installed both R and RStudio, open RStudio and paste the following code into the Console window and hit the Enter/Return key. 

``
install.packages(c("tidyverse", "broom", "stringr", "RCurl", "tidytext", "httr", "rvest", "curl", "devtools", "rmarkdown", "knitr", "shiny", "RColorBrewer", "leaflet", "rgdal", "maptools", "GGally", "network", "sna", "intergraph", "networkD3", "lubridate", "scales", "mosaic"))
``


Many materials for this workshop are modified from other existing resources. Some credits:
- NICAR16 [Intro to R workshop](https://github.com/CoulterJones/NICAR16), with Coulter Jones
- [OpenIntro labs](https://github.com/andrewpbray/oiLabs-dplyr-ggplot), many contributors including Mine Cetinkaya-Rundel, Andrew Bray, Ben Baumer, and Albert Kim. 
- [Summer DataViz workshop](https://github.com/ameliamn/summerdataviz) for MassMutual, with Jordan Crouser