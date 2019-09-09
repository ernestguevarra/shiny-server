################################################################################
#
#
#
# This is a Shiny web application to support the implementation of health and
# nutrition coverage surveys in Liberia.
#
# This code is for the global R requirements of the Shiny web application.
#
#
################################################################################


################################################################################
#
# Set-up
#
################################################################################
#
# Load libraries
#
if(!require(shiny)) install.packages("shiny")
if(!require(shinydashboard)) install.packages("shinydashboard")
if(!require(devtools)) install.packages("devtools")
if(!require(magrittr)) install.packages("magrittr")
if(!require(bbw)) install.packages("bbw")
if(!require(shinyjs)) install.packages("shinyjs")
if(!require(maptools)) install.package("maptools")
if(!require(rgdal)) install.packages("rgdal")
if(!require(rgeos)) install.packages("rgeos")
if(!require(raster)) install.packages("raster")
if(!require(leaflet)) install.packages("leaflet")
if(!require(ggmap)) install.packages("ggmap")
if(!require(DT)) install.packages("DT")
if(!require(zscorer)) install.packages("zscorer")
if(!require(RColorBrewer)) install.packages("RColorBrewer")
if(!require(plotly)) install.packages("plotly")
if(!require(stringr)) install.packages("stringr")

if(!require(liberia)) install_github("validmeasures/liberia")
if(!require(liberiaData)) install_github("validmeasures/liberiaData")
if(!require(spatialsampler)) install_github("SpatialWorks/spatialsampler")
if(!require(odkr)) install_github("validmeasures/odkr")
if(!require(sampsizer)) install_github("ernestguevarra/sampsizer")

################################################################################

## Create Mapbox base layer objects for leaflet mapping
mapbox.satellite <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.street    <- "https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.dark      <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.light     <- "https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.moonlight <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj3nban30001z2rpahc10c9ef/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.northstar <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj4ke832y4sng2spe2ds4fs55/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.standard  <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5di36jn0gxg2rphjn3yetpt/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.decimal   <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5ms1akt3pbi2smtcewsex9m/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.terminal  <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj6g0tzbd30kc2sph2wyh666m/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"

################################################################################

monrovia <- subset(liberia::districts, admin2Name == "Greater Monrovia")
gmLng1 <- bbox(monrovia)[1, 1]
gmLat1 <- bbox(monrovia)[2, 1]
gmLng2 <- bbox(monrovia)[1, 2]
gmLat2 <- bbox(monrovia)[2, 2]

gmLng <- coordinates(monrovia)[1]
gmLat <- coordinates(monrovia)[2]

grandBassa <- subset(liberia::counties, admin1name == "Grand Bassa")
gbLng1 <- bbox(grandBassa)[1, 1]
gbLat1 <- bbox(grandBassa)[2, 1]
gbLng2 <- bbox(grandBassa)[1, 2]
gbLat2 <- bbox(grandBassa)[2, 2]

################################################################################

themeSettings <- theme_bw() + 
  theme(panel.border = element_rect(colour = "#993300",
                                    size = 0.5),
        panel.grid.major = element_line(linetype = 1, 
                                        size = 0.2, 
                                        colour = "gray90"),
        panel.grid.minor = element_line(linetype = 0),
        strip.background = element_rect(colour = "#993300",
                                        fill = "#993300"),
        strip.text = element_text(colour = "white"),
        legend.key = element_rect(linetype = 0),
        axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        #axis.title.x = element_text(colour = "gray50"),
        #axis.title.y = element_text(colour = "gray50"),
        axis.ticks = element_line(colour = "#993300", size = 0.5))

