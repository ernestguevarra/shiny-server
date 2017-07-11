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
temp1 <- subset(areaResults, select = c(country:strata, slumTotal, slumEst))
temp2 <- subset(areaResults, select = c(country:strata, otherTotal, otherEst))
temp3 <- subset(areaResults, select = c(country:strata, total, totalEst))
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
                  "indicatorCode", "strata", "n", "estimate", "type")
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
                              areaResultsLong[ , c("strata", "n", "estimate", "type")])
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
temp1 <- subset(wealthResults, select = c(country:strata, slumTotal, slumEst))
temp2 <- subset(wealthResults, select = c(country:strata, otherTotal, otherEst))
temp3 <- subset(wealthResults, select = c(country:strata, total, totalEst))
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
                  "indicatorCode", "strata", "n", "estimate", "type")
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
                                wealthResultsLong[ , c("strata", "n", "estimate", "type")])
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


################################################################################
#                                                                              #
#                ASSEMBLE COLOUR VECTORS FOR CHARTS AND MAPS                   #
#                                                                              #
################################################################################

################################################################################
#
# Qualitative colour scheme
#
################################################################################
#
# Two colours
#
area2  <- c("#fbb4ae", "#b3cde3")
#
# Three colours
#
area3  <- c("#fbb4ae", "#b3cde3", "#ccebc5")
#
# Five colours
#
area5  <- c("#fbb4ae", "#b3cde3", "#ccebc5", "#decbe4", "#fed9a6")
#
# Seven colours
#
area7  <- c("#fbb4ae", "#b3cde3", "#ccebc5", "#decbe4", "#fed9a6",
	       "#ffffcc", "#e5d8bd")
#
# Nine colours
#
area9  <- c("#8dd3c7", "#ffffb3", "#bebada", "#fb8072", "#80b1d3",
	       "#fdb462", "#b3de69", "#fccde5", "#d9d9d9")
#
# Ten colours
#
area10 <- c("#8dd3c7", "#ffffb3", "#bebada", "#fb8072", "#80b1d3",
	       "#fdb462", "#b3de69", "#fccde5", "#ccebc5", "#bc80bd") 

################################################################################
#
# Divergent colour scheme
#
################################################################################
#
# Seven colour red-yellow-blue scheme
#
RdYlBl7 <- c("#d73027", "#fc8d59", "#fee090", "#ffffbf", 
	        "#e0f3f8", "#91bfdb", "#4575b4")
#
# Seven colour red-yellow-green colour scheme
#
RdYlGn7 <- c("#d73027", "#fc8d59", "#fee08b", "#ffffbf", 
      	   "#d9ef8b", "#91cf60", "#1a9850")
#
# Five colour red-yellow-green colour scheme
#             
RdYlGn5 <- c("#d7191c", "#fdae61", "#ffffbf", "#a6d96a", "#1a9641")
#
# Three colour red-yellow-green colour scheme
#
RdYlGn3 <- c("#d73027", "#ffffbf", "#1a9850")

################################################################################
#
# Sequential colour scheme
#
################################################################################
#
# Seven colour multi-hue yellow-blue colour scheme 
#
YlBl7 <- c("#ffffcc", "#c7e9b4", "#7fcdbb", "#41b6c4",
	      "#1d91c0", "#225ea8", "#0c2c84")
#
# Five colour multi-hue yellow-blue colour scheme
#
YlBl5 <- c("#ffffcc", "#a1dab4", "#41b6c4", "#2c7fb8", "#253494")
#
# Seven colour multi-hue yellow-red colour scheme
#
YlRd7 <- c("#ffffb2", "#fed976", "#feb24c", "#fd8d3c", 
	      "#fc4e2a", "#e31a1c", "#b10026")
#
# Five colour multi-hue yellow-red colour scheme
#
YlRd5 <- c("#ffffb2", "#fecc5c", "#fd8d3c", "#f03b20", "#bd0026")
#
# Seven colour multi-hue yellow-brown colour scheme
#
YlBn7 <- c("#ffffd4", "#fee391", "#fec44f", "#fe9929",
           "#ec7014", "#cc4c02", "#8c2d04")
#
# Five colour multi-hue yellow-brown colour scheme
#
YlBn5 <- c("#ffffd4", "#fed98e", "#fe9929", "#d95f0e", "#993404")
#
# Nine colour multi-hue yellow-brown colour scheme
#
YlBn9 <- c("#ffffe5", "#fff7bc", "#fee391", "#fec44f", "#fe9929",
            "#ec7014", "#cc4c02", "#993404", "#662506")
#
# Seven colour single-hue gray colour scheme
#
Gy7 <- c("#f7f7f7", "#d9d9d9", "#bdbdbd", "#969696", "#737373",
	     "#525252", "#252525")
#
# Five colour single-hue gray colour scheme
#
Gy5 <- c("#f7f7f7", "#cccccc", "#969696", "#636363", "#252525")

################################################################################
#
# Create colour ramps and other colour objects for mapping
#
################################################################################
#
# Create 101 colours from RdYlBl7 colour vector for population maps
#
createMapPalette <- colorRampPalette(colors = RdYlBl7, space = "Lab")
popPalette <- createMapPalette(101)
#
# Create 101 colours from RdYlGn7 colour vector for general indicators mapping
#
createMapPalette <- colorRampPalette(colors = RdYlGn7, space = "Lab")
mapPalette <- createMapPalette(101)
mapFill <- addAlpha(col = mapPalette, alpha = 0.6)
#
# Create 101 colours from Gy7 colour vector for poverty mapping
#
createMapPalette <- colorRampPalette(colors = Gy7, space = "Lab")
povPalette <- createMapPalette(101)
povFill <- addAlpha(col = povPalette, alpha = 0.6)
#
# Create 101 colours from YlRd7 colour vector for prevalence indicators mapping
#
createMapPalette <- colorRampPalette(colors = YlRd7, space = "Lab")
prevPalette <- createMapPalette(101)
prevFill <- addAlpha(col = prevPalette, alpha = 0.6)
#
# Create 101 colours from YlBl7 colour vector for mean indicator mapping
#
createMapPalette <- colorRampPalette(colors = YlBl7, space = "Lab")
meanPalette <- createMapPalette(101)
meanFill <- addAlpha(col = meanPalette, alpha = 0.6)
#
# Create 101 colours from Gy7 colour vector for monochrome colour scheme
#
createMapPalette <- colorRampPalette(colors = Gy7, space = "Lab")
monoPalette <- createMapPalette(101)
monoFill <- addAlpha(col = monoPalette, alpha = 0.6)
#
# Change alpha of RdYlGn5 colour vector - alpha = 0.6
#
aRdYlGn5 <- addAlpha(col = RdYlGn5, alpha = 0.6)
#
# Change alpha of RdYlGn3 colour vector - alpha = 0.6
#
aRdYlGn3 <- addAlpha(col = RdYlGn3, alpha = 0.6)
#
# Change alpha of RdYlGn5 colour vector - alpha = 0.6
#
aYlBl5 <- addAlpha(col = YlBl5, alpha = 0.6)
#
# Change alpha of YlRd5 colour vector - alpha = 0.6
#
aYlRd5 <- addAlpha(col = YlRd5, alpha = 0.6)


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
#
# Seven colour water palette scheme
#
water7 <- c("#eff3ff", "#c6dbef", "#9ecae1", "#6baed6", 
            "#4292c6", "#2171b5", "#084594")
#
# Create 101 colours from water7 colour vector for water indiators
#            
createMapPalette <- colorRampPalette(colors = water7, space = "Lab")
waterPalette <- createMapPalette(101)
waterFill <- addAlpha(col = waterPalette, alpha = 0.6)
#
# Seven colour sanitation palette scheme
#
sanitation7 <- c("#edf8e9", "#c7e9c0", "#a1d99b", "#74c476",
                 "#41ab5d", "#238b45", "#005a32")
#
# Create 101 colours from sanitation7 colour vector for sanitation indicators
#
createMapPalette <- colorRampPalette(colors = sanitation7, space = "Lab")
sanitationPalette <- createMapPalette(101)
sanitationFill <- addAlpha(col = sanitationPalette, alpha = 0.6)
#
# Five colour handwashing palette scheme
#
handwashing5 <- c("#f7fcf0", "#e0f3db", "#ccebc5", "#a8ddb5", "#7bccc4")
#
# Create 101 colours from handwashing5 colour vector for handwashing indicators
#
createMapPalette <- colorRampPalette(colors = handwashing5, space = "Lab")
handwashingPalette <- createMapPalette(101)
handwashingFill <- addAlpha(col = handwashingPalette, alpha = 0.6)


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
#
#
long.lat.crs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
#
# Read shapefiles - outline of survey areas
#
outline <- readOGR(dsn = "surveyArea3",
                   layer = "surveyArea3",
                   verbose = FALSE)
#
#
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
#
#
wards <- spTransform(wards, CRSobj = CRS(long.lat.crs))
#
#
#                 
map.results <- merge(areaResults, outline, by.x = "strata", by.y = "surveyArea")
#
#
#
slum.results.df <- data.frame(matrix(nrow = 9, ncol = 50))
#
#
#
names(slum.results.df) <- steerIndicators$varList
#
#
#
city.results.df <- data.frame(matrix(nrow = 9, ncol = 50))
#
#
#
names(city.results.df) <- steerIndicators$varList
#
#
#
for(i in steerIndicators$varList)
  {
  #
  #
  #
  slum.results <- subset(x = map.results, 
                         subset = indicatorCode == i, 
                         select = slumEst)
  #
  #
  #
  city.results <- subset(x = map.results, 
                         subset = indicatorCode == i, 
                         select = totalEst)
  #
  #
  #
  slum.results.df[ , i] <- slum.results
  city.results.df[ , i] <- city.results
  }
#
#
#         
slum.results.df <- data.frame("surveyArea" = paste("Survey Area", 1:9, sep = " "), slum.results.df)
city.results.df <- data.frame("surveyArea" = paste("Survey Area", 1:9, sep = " "), city.results.df)
#
#
#
slum.results.sp <- merge(outline, slum.results.df, by = "surveyArea")
city.results.sp <- merge(outline, city.results.df, by = "surveyArea")
#
#
#
mapbox.satellite <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.street <- "https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.dark <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"
mapbox.light <- "https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXJuZXN0Z3VldmFycmEiLCJhIjoiejRRLXlZdyJ9.sqS1zi0rDH5CIzvcn9SXSg"

