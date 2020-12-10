rm(list=ls())

library(devtools)

#Install WaterBalance package from Github repository
#install_github("CCRP-Adaptation/WaterBalance", subdir="WaterBalance")

#Or, install from local folder
setwd("C:/Users/adillon/Documents/R/win-library/4.0") #Directory containing package folder
install("WaterBalance")

#devtools::install("WaterBalance")
library(WaterBalance)
