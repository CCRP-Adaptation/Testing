# install.packages("remotes")
remotes::install_github("earthlab/cft")
#cft::install_py_deps()

library(ggplot2)
library(cft)
library(reticulate)
library(sp)
library(sf)
library(dplyr)

# Now can only use spatial object (not park name)

# Load Data 
nps_boundary_centroids <- st_read('C:/Users/adillon/Documents/ArcGIS/nps_boundary_centroids/nps_boundary_centroids.shp')
centroid <- filter(nps_boundary_centroids, UNIT_CODE == "MACA")

centroid.maca <- as_Spatial(centroid) # Does not accept sf objects 

# Extract

d <- cftdata(aoi = centroid.maca, area_name = "MACA", 
             years = c(2020, 2021), models = "CCSM4", scenarios = "rcp85")

df <- cft_df(d, ncores = 2)
head(df)

df %>%
  ggplot(aes(date, pr)) + 
  geom_point() + 
  geom_line(alpha = .1) + 
  xlab("Date") + 
  ylab("Precipitation (mm)") + 
  ggtitle("MACA Centroid, CCSM4, RCP 8.5")

centroid.wica <- filter(nps_boundary_centroids, UNIT_CODE == "WICA")
centroid.wicadf2 <- cft_df(e, ncores = 2)

df2 %>%
  ggplot(aes(date, pr)) + 
  geom_point() + 
  geom_line(alpha = .1) + 
  xlab("Date") + 
  ylab("Precipitation (mm)") + 
  ggtitle("Wind Cave Centroid, CCSM4, RCP 4.5") <- as_Spatial(centroid.wica)

#e <- cftdata(park = "Isle Royale National Park", parameters = "pr", years = c(2005, 2006), models = "CCSM4", scenarios = "rcp45")

e <- cftdata(aoi = centroid.wica, area_name = "WICA", 
             years = c(2005, 2006), models = "CCSM4", scenarios = "rcp45")


