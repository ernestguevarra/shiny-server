################################################################################
#
# Global parameters
#
################################################################################
#
# Load libraries
#
library(shiny)
library(leaflet)
library(shinythemes)
library(rgdal)
library(rgeos)
library(raster)
library(stringr)
library(uypa)

mapbox.satellite <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.street    <- "https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.dark      <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.light     <- "https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.moonlight <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj3nban30001z2rpahc10c9ef/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.northstar <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj4ke832y4sng2spe2ds4fs55/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.standard  <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5di36jn0gxg2rphjn3yetpt/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.decimal   <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5ms1akt3pbi2smtcewsex9m/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.terminal  <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj6g0tzbd30kc2sph2wyh666m/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"

