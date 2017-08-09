################################################################################
#
# Global parameters
#
################################################################################
#
# Load libraries
#
library(shiny)
library(ggplot2)
library(ggmap)
library(stringr)
library(leaflet)
library(shinycssloaders)
library(shinythemes)
library(geojsonio)
library(rgdal)
library(rgeos)
library(raster)
library(maps)
library(RColorBrewer)
library(classInt)
library(DT)
library(Hmisc)
library(purrr)
library(gstat)
library(shinyjs)
library(epitools)
#
# Create Mapbox base layer objects for leaflet mapping
#
mapbox.satellite <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.street    <- "https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.dark      <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.light     <- "https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.moonlight <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj3nban30001z2rpahc10c9ef/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.northstar <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj4ke832y4sng2spe2ds4fs55/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.standard  <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5di36jn0gxg2rphjn3yetpt/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.decimal   <- "https://api.mapbox.com/styles/v1/ernestguevarra/cj5ms1akt3pbi2smtcewsex9m/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
#
# Read steering file
#
steerIndicators <- read.csv("steerIndicatorsV8.csv", header = TRUE, sep = ",")
#
# Create indicator choices for dropdown
#
vars <- as.character(steerIndicators$varList)
names(vars) <- steerIndicators$varShort

sets <- as.character(unique(steerIndicators$varSet))
names(sets) <- unique(steerIndicators$varTitle)

varSet1  <- c(vars[steerIndicators$varSet == "demographics"])
varSet2  <- c(vars[steerIndicators$varSet == "poverty"])
varSet3  <- c(vars[steerIndicators$varSet == "waterSet1"])
varSet4  <- c(vars[steerIndicators$varSet == "waterSet2"])
varSet5  <- c(vars[steerIndicators$varSet == "waterSet3"])
varSet6  <- c(vars[steerIndicators$varSet == "sanSet1"])
varSet7  <- c(vars[steerIndicators$varSet == "sanSet2"])
varSet8  <- c(vars[steerIndicators$varSet == "sanSet3"])
varSet9  <- c(vars[steerIndicators$varSet == "sanSet4"])
varSet10 <- c(vars[steerIndicators$varSet == "handSet"])
varSet11 <- c(vars[steerIndicators$varSet == "hygieneSet"])
varSet12 <- c(vars[steerIndicators$varSet == "overallSet1"])
varSet13 <- c(vars[steerIndicators$varSet == "overallSet2"])


################################################################################
#
# Pre-load data
#
################################################################################
#
# Pre-load data
#
current.data <- read.csv(file = "surveyResultsAll.csv", header = TRUE, sep = ",")
current.data <- current.data[order(current.data$indicatorCode), ]


################################################################################
#
# Pre-load maps
#
################################################################################
#
# Create GPS long/lat CRS object
#
long.lat.crs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
#
# Pre-load Dhaka Bangladesh map
#
dhaka.map <- readOGR(dsn = "dhaka",
                     layer = "dhaka",
                     verbose = FALSE)
#
#
#
dhaka.map <- spTransform(dhaka.map, CRSobj = CRS(long.lat.crs))
#
# Pre-load Accra, Ghana map
#
accra.map <- readOGR(dsn = "accra",
                     layer = "accra",
                     verbose = FALSE)
#
# Pre-load Nakuru, Kenya map
#
nakuru.map <- readOGR(dsn = "nakuru",
                      layer = "nakuru",
                      verbose = FALSE)
#
# Pre-load Antananarivo, Madagascar map
#
antananarivo.map <- readOGR(dsn = "antananarivo",
                            layer = "tnr2",
                            verbose = FALSE)
#
# Pre-load Maputo, Mozambique map
#
maputo.map <- readOGR(dsn = "maputo",
                      layer = "maputo",
                      verbose = FALSE)
#
# Pre-load Lusaka, Zambia map
#
lusaka.map <- readOGR(dsn = "lusaka",
                      layer = "lusaka",
                      verbose = FALSE)
#
#
#
lusaka.map <- spTransform(lusaka.map, CRSobj = CRS(long.lat.crs))
                                      
################################################################################
#
# Formatting legends
#
################################################################################

legend.format <- function (prefix = "", suffix = "", between = " &ndash; ", digits = 3, 
    big.mark = ",", transform = identity) 
{
    formatNum <- function(x) {
        format(round(transform(x), digits), trim = TRUE, scientific = FALSE, 
            big.mark = big.mark)
    }
    function(type, ...) {
        switch(type, numeric = (function(cuts) {
            paste0(prefix, formatNum(cuts), suffix)
        })(...), bin = (function(cuts) {
            n = length(cuts)
            paste0(prefix, formatNum(cuts[-n]), between, formatNum(cuts[-1]), 
                suffix)
        })(...), quantile = (function(cuts, p) {
            n = length(cuts)
            p = paste0(round(p * 100), "%")
            cuts = paste0(formatNum(cuts[-n]), between, formatNum(cuts[-1]), suffix)
        })(...), factor = (function(cuts) {
            paste0(prefix, as.character(transform(cuts)), suffix)
        })(...))
    }
}


################################################################################
#
# 2 x 2 comparisons function
#
################################################################################

tab2by2 <- function(exposure, outcome)
  {
  tab <- table(exposure, outcome)
  
  a <- tab[1,1]
  b <- tab[1,2]
  c <- tab[2,1]
  d <- tab[2,2]
  
  rr <- (a / (a + b)) / (c / (c + d))
  
  se.log.rr <- sqrt((b / a) / (a + b) + (d / c) / (c + d))
  
  lci.rr <- exp(log(rr) - 1.96 * se.log.rr)
  
  uci.rr <- exp(log(rr) + 1.96 * se.log.rr)
  
  or <- (a / b) / (c / d)
  
  se.log.or <- sqrt(1 / a + 1 / b + 1 / c + 1 / d)
  
  lci.or <- exp(log(or) - 1.96 * se.log.or)
  
  uci.or <- exp(log(or) + 1.96 * se.log.or)
    
  rr.values <- c(round(rr, digits = 4), 
                 round(se.log.rr, digits = 4), 
                 paste(round(lci.rr, digits = 2), " to ", round(uci.rr, digits = 2), sep = ""))
  
  rr.names <- c("Risk ratio", "Standard error", "95% CI")
  
  rr.df <- data.frame(rr.names, rr.values)
  
  names(rr.df) <- c("Parameters", "Values")
  
  return(rr.df)
  }
  

################################################################################
#
# Function to add alpha parameter to colours
#
################################################################################

addArea <- function(string, prefix = "Survey Area") paste(prefix, string, sep = " ")
addWealth <- function(string, prefix = "Wealth Quintile") paste(prefix, string, sep = " ")


################################################################################
#                                                                              #
#                ASSEMBLE COLOUR VECTORS FOR CHARTS AND MAPS                   #
#                                                                              #
################################################################################

################################################################################
#
# Create WSUP-specific and WASH-specific colour schemes
#
################################################################################
#
# WSUP blue colour fill
#
wsupFill   <- "#c6dbef"
#
# WSUP blue colour border
#
wsupColour <- "#3182bd"
#
# Error bar colour
#
errorColour <- "#e41a1c" #"#99000d"
#
# Spinner colour
#
options(spinner.color = wsupColour)
#
# WASH ladder indicators colour schemes
#
waterLadder <- c("#4575b4", "#74add1", "#ffffbf", "#feb24c", "#ec7014")
sanitationLadder <- c("#1a9850", "#a6d96a", "#ffffbf", "#feb24c", "#ec7014")
handwashLadder <- c("#cab2d6", "#feb24c", "#ec7014")
#
# Colour for water collector plots
#
collectColour <- c("#fbb4ae", "#b3cde3", "#ccebc5", "#decbe4", "#fed9a6")
#
# Colour for formal/informal plots
#
formalColour <- c("#a6cee3", "#1f78b4")
#
# Overall indicators colour schemes
#
overallColour <- c("#fdbf6f", "#b2df8a", "#a6cee3", "#80cdc1")


################################################################################
#
# Create WSUP theme for shiny
#
################################################################################

theme_wsup <- theme_bw() + 
              theme(strip.text = element_text(size = 12), 
                    strip.background = element_rect(colour = wsupColour, size = 1, fill = wsupFill),
                    axis.title = element_text(size = 12),
                    axis.text = element_text(size = 10),
                    panel.border = element_rect(colour = "gray90"),
                    panel.background = element_rect(fill = "transparent"),
                    legend.key = element_rect(colour = NA, fill = NA),
                    legend.key.size = unit(25, "pt"),
                    legend.title = element_text(size = 12),
                    legend.text = element_text(size = 10))

