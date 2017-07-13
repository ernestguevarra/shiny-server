################################################################################
#
# Load libraries
#
################################################################################

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


################################################################################
#
# Function to add alpha parameter to colours
#
################################################################################

addAlpha <- function(col, alpha)
  {
  apply(X = sapply(col, col2rgb)/255, 
        MARGIN = 2,
        FUN = function(x) { rgb(x[1], x[2], x[3], alpha = alpha) })
  }

legend.format <- function(type, cuts, p)
  {
  
  formatNum <- function(x) {
        format(round(transform(x), digits), trim = TRUE, scientific = FALSE, 
            big.mark = big.mark)
    }
  
  n = length(cuts)
  paste0(formatNum(cuts[-n]), " &ndash; ", formatNum(cuts[-1]))
  }


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
# Function to add alpha parameter to colours
#
################################################################################

addArea <- function(string, prefix = "Survey Area") paste(prefix, string, sep = " ")
addWealth <- function(string, prefix = "Wealth Quintile") paste(prefix, string, sep = " ")


################################################################################
#
# Read indicators steering file and indicators data.frame
#
################################################################################
#
# Steer indicators
#
steerIndicators <- read.csv("steerIndicatorsV7.csv", header = TRUE, sep = ",")
#
#
#
indicatorsDF <- read.csv("indicatorsDataBGD.csv", header = TRUE, sep = ",")
#
#
#
indicatorsDF$type <- ifelse(indicatorsDF$type == 1, "Slum", "Other")
#
#
#
indicatorsDF$type <- factor(indicatorsDF$type, levels = c("Slum", "Other"))


################################################################################
#
# Read survey results datasets and concatenate into single data.frame
#
################################################################################
#
# Read dataset - survey areas
#
areaResults <- read.csv("surveyResultsBGD.csv", header = TRUE, sep = ",")
#
# Rename surveyArea
#
names(areaResults)[5]  <- "strata"
#
# Read dataset - wealth quintiles
#
wealthResults <- read.csv("surveyResultsWealthBGD.csv", header = TRUE, sep = ",")
#
# wealthQuintile
#
names(wealthResults)[5]  <- "strata"


################################################################################
#
# Transform areaResults to long format for ggplot
#
################################################################################
#
# Subset survey results to columns needed for plotting
#
temp1 <- subset(areaResults, select = c(country:strata, slumTotal, slumEst, slumLCL, slumUCL))
temp2 <- subset(areaResults, select = c(country:strata, otherTotal, otherEst, otherLCL, otherUCL))
temp3 <- subset(areaResults, select = c(country:strata, total, totalEst, totalLCL, totalUCL))
#
# Add area type variable
#
temp1$type <- rep("Slum", nrow(temp1))
temp2$type <- rep("Other", nrow(temp2))
temp3$type <- rep("Citywide", nrow(temp3))
#
# Rename variables
#
names(temp1) <- c("country", "countryCode", "indicatorName", 
                  "indicatorCode", "strata", "n", "estimate", "lcl", "ucl", "type")
names(temp3) <- names(temp2) <- names(temp1)
#
# Create single long data.frame
#
areaResultsLong <- data.frame(rbind(temp1, temp2, temp3))
#
# Add indicatorCategory variable
#
indicatorCategory <- vector(mode = "character", length = nrow(areaResultsLong))
#
# Water Indicators
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet1"]] <- "waterSet1"
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet2"]] <- "waterSet2"                           
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet3"]] <- "waterSet3"
#
# Sanitation Indicators
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet1"]] <- "sanSet1"
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet2"]] <- "sanSet2"                           
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet3"]] <- "sanSet3"
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet4"]] <- "sanSet4"
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet5"]] <- "sanSet5"
#
# Handwashing Indicators
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "handSet"]] <- "handSet"
#
# Demographics
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "demographics"]] <- "demographics"
#
# Hygiene indicators
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "hygieneSet"]] <- "hygieneSet"
#
# Poverty
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "poverty"]] <- "poverty"
#
# Overall indicators
#
indicatorCategory[areaResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "overallSet1"]] <- "overallSet1"
#
# Other indicators
#
indicatorCategory[!areaResultsLong$indicatorCode %in% steerIndicators$varList] <- "other"
#
# Add indicatorCategory to areaResultsLong data.frame
#
areaResultsLong <- data.frame(areaResultsLong[ , c("country", "countryCode", "indicatorName", "indicatorCode")], indicatorCategory,
                              areaResultsLong[ , c("strata", "n", "estimate", "lcl", "ucl", "type")])
#
# Remove other area type
#
areaResultsLong <- subset(areaResultsLong, type != "Other")
#
# Sort order of area type factors
#
areaResultsLong$type <- factor(areaResultsLong$type, levels = c("Slum", "Citywide"))
#
# Change strata names
#
areaResultsLong$strata <- str_split(string = areaResultsLong$strata, 
                                    pattern = " ",
                                    simplify = TRUE)[ , 3]


################################################################################
#
# Transform wealthResults to long format for ggplot
#
################################################################################
#
# Subset survey results to columns needed for plotting
#
temp1 <- subset(wealthResults, select = c(country:strata, slumTotal, slumEst, slumLCL, slumUCL))
temp2 <- subset(wealthResults, select = c(country:strata, otherTotal, otherEst, otherLCL, otherUCL))
temp3 <- subset(wealthResults, select = c(country:strata, total, totalEst, totalLCL, totalUCL))
#
# Add area type variable
#
temp1$type <- rep("Slum", nrow(temp1))
temp2$type <- rep("Other", nrow(temp2))
temp3$type <- rep("Citywide", nrow(temp3))
#
# Rename variables
#
names(temp1) <- c("country", "countryCode", "indicatorName", 
                  "indicatorCode", "strata", "n", "estimate", "lcl", "ucl", "type")
names(temp3) <- names(temp2) <- names(temp1)
#
# Create single long data.frame
#
wealthResultsLong <- data.frame(rbind(temp1, temp2, temp3))
#
# Add indicatorCategory variable
#
indicatorCategory <- vector(mode = "character", length = nrow(wealthResultsLong))
#
# Water Indicators
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet1"]] <- "waterSet1"
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet2"]] <- "waterSet2"                           
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "waterSet3"]] <- "waterSet3"
#
# Sanitation Indicators
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet1"]] <- "sanSet1"
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet2"]] <- "sanSet2"                           
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet3"]] <- "sanSet3"
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet4"]] <- "sanSet4"
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "sanSet5"]] <- "sanSet5"
#
# Handwashing Indicators
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "handSet"]] <- "handSet"
#
# Demographics
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "demographics"]] <- "demographics"
#
# Hygiene indicators
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "hygieneSet"]] <- "hygieneSet"
#
# Poverty
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "poverty"]] <- "poverty"
#
# Overall indicators
#
indicatorCategory[wealthResultsLong$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "overallSet1"]] <- "overallSet1"
#
# Other indicators
#
indicatorCategory[!wealthResultsLong$indicatorCode %in% steerIndicators$varList] <- "other"
#
# Add indicatorCategory to wealthResultsLong data.frame
#
wealthResultsLong <- data.frame(wealthResultsLong[ , c("country", "countryCode", "indicatorName", "indicatorCode")], indicatorCategory,
                                wealthResultsLong[ , c("strata", "n", "estimate", "lcl", "ucl", "type")])
#
# Remove other area type
#
wealthResultsLong <- subset(wealthResultsLong, type != "Other")
#
# Sort order of area type factors
#
wealthResultsLong$type <- factor(wealthResultsLong$type, levels = c("Slum", "Citywide"))
#
# Change strata names
#
wealthResultsLong$strata <- str_split(string = wealthResultsLong$strata, 
                                      pattern = " ",
                                      simplify = TRUE)[ , 3]
#
# Clean-up
#
rm(indicatorCategory, temp1, temp2, temp3)


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
              theme(strip.text = element_text(size = 16), 
                    strip.background = element_rect(colour = "black", size = 0.5),
                    axis.title = element_text(size = 16),
                    axis.text = element_text(size = 14),
                    panel.border = element_rect(colour = "gray90", fill = NA),
                    legend.key = element_rect(colour = NA, fill = NA),
                    legend.key.size = unit(25, "pt"),
                    legend.title = element_text(size = 16),
                    legend.text = element_text(size = 14))


################################################################################
#
# Mapping
#
################################################################################
#
# Create GPS long/lat CRS object
#
long.lat.crs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
#
# Read shapefiles - outline of survey areas
#
outline <- readOGR(dsn = "surveyArea3",
                   layer = "surveyArea3",
                   verbose = FALSE)
#
# Transform outline CRS to long/lat
#
outline <- spTransform(outline, CRSobj = CRS(long.lat.crs))
#
# Read shapefiles - wards
#
wards <- readOGR(dsn = "surveyArea",
                 layer = "surveyArea",
                 verbose = FALSE)
#
# Read shapefiles - upazila
#
upazila <- readOGR(dsn = "dhaka3",
                   layer = "dhaka3",
                   verbose = FALSE)
#
# Transform wards CRS to long/lat
#
wards <- spTransform(wards, CRSobj = CRS(long.lat.crs))
#
# Merge shapfile with results data by survey area
#                 
map.results <- merge(areaResults, outline, by.x = "strata", by.y = "surveyArea")
#
# Create container data.frame from slum results
#
slum.results.df <- data.frame(matrix(nrow = 9, ncol = 50))
#
# Rename container slum data.frame based on steerIndicators
#
names(slum.results.df) <- steerIndicators$varList
#
# Create container data.frame from city results
#
city.results.df <- data.frame(matrix(nrow = 9, ncol = 50))
#
# Rename container city data.frame based on steerIndicators
#
names(city.results.df) <- steerIndicators$varList
#
# Cycle through variable names
#
for(i in steerIndicators$varList)
  {
  #
  # Subset results data.frame to current indicator results for slum
  #
  slum.results <- subset(x = map.results, 
                         subset = indicatorCode == i, 
                         select = slumEst)
  #
  # Subset results data.frame to current indicator results for city
  #
  city.results <- subset(x = map.results, 
                         subset = indicatorCode == i, 
                         select = totalEst)
  #
  # Insert slum and city indicator results to respective container data.frame
  #
  slum.results.df[ , i] <- slum.results
  city.results.df[ , i] <- city.results
  }
#
# Create results data.frame for slum and city
#         
slum.results.df <- data.frame("surveyArea" = paste("Survey Area", 1:nrow(slum.results.df), sep = " "), slum.results.df)
city.results.df <- data.frame("surveyArea" = paste("Survey Area", 1:nrow(city.results.df), sep = " "), city.results.df)
#
# Merge results data.frame with corresponding shapefile
#
slum.results.sp <- merge(outline, slum.results.df, by = "surveyArea")
city.results.sp <- merge(outline, city.results.df, by = "surveyArea")
#
# Create Mapbox base layer objects for leaflet mapping
#
mapbox.satellite <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.street <- "https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.dark <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.light <- "https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
#
# Clean-up
# 
rm(i, map.results, slum.results.df, city.results.df, slum.results, city.results)

