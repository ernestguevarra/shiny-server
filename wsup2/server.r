################################################################################
#
# Server function
#
################################################################################


function(input, output, session) {
  #
  # Read uploaded data
  #
  survey.dataset <- reactive({
    #
    # Use pre-loaded data if no dataset is uploaded
    #
    inputFile <- input$file1
    if(is.null(inputFile)){ 
      current.data 
    }
    #
    # If dataset is uploaded...
    #
    else{
      #
      # Read dataset file
      #
      read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
    }
  })
  #
  # Update country select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "country",
      label = "Country",
      choices = list(Select = ".", unique(survey.dataset()$country)),
      selected = "."
    )
  })
  #
  #
  #
  observe({
	#
	#
	#
	if(input$city != "."){
	  #
	  #
	  #
	  updateSelectInput(session = session,
	    inputId = "varSet",
	    label = "Select Indicator Set",
	    choices = c("Select" = ".", sets),
	    selected = ".")
	}
  })
  #
  #
  #
  observe({
    #
    #
    #
    updateSelectInput(session = session,
	  inputId = "varList",
	  label = "Select indicator",
	  choices = c("Select" = ".",
				  vars[as.character(steerIndicators$varShort)[steerIndicators$varSet == input$varSet]]),
	  selected = ".")
  })
  #
  # Update city select input based on country/ies in dataset
  #
  observe({
    #
    # Bangladesh
    #
    if(input$country == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".", 
                                    "Dhaka" = "Dhaka"))
    #
    # Ghana
    #
    if(input$country == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Accra" = "Accra"))    
    # 
    # Kenya
    #
    if(input$country == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Nakuru" = "Nakuru"))    
    #
    # Madagascar
    #
    if(input$country == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Antananarivo" = "Antananarivo"))    
    #
    # Mozambique
    #
    if(input$country == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Maputo" = "Maputo"))
    #
    # Zambia
    #
    if(input$country == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Lusaka" = "Lusaka"))
  })
  #
  # Update years select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "start.year",
      label = "From",
      choices = unique(survey.dataset()$year)
    )
  })
  #
  # Update years select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "end.year",
      label = "To",
      choices = unique(survey.dataset()$year)[unique(survey.dataset()$year) >= input$start.year]
    )
  })
  #
  #
  #
  sub.data <- reactive({
    #
    #
    #
    subset(survey.dataset(),
           subset = country == input$country & 
                    year >= input$start.year & year <= input$end.year &
                    indicatorCode == input$varList)
  })
  #
  #
  #
  ladder.data <- reactive({
    #
    #
    #
    subset(survey.dataset(),
           subset = country == input$country & 
                    year >= input$start.year & year <= input$end.year &
                    indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$varSet])                    
  })
  #
  # Create map data for slum areas of current city and indicator
  #
  slum.map.data <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
                   type == "Slum" &
                   !strata %in% c(paste("Wealth Quintile ", 1:5, sep = ""), "Overall"))
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      temp$estimate <- temp$estimate * 100
      }
    #
    #
    #
    merge(dhaka.map, temp, by.x = "surveyArea", by.y = "strata")
  })
  #
  # Create map data for city areas of current city and indicator
  #
  city.map.data <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
                   type == "Citywide" &
                   !strata %in% c(paste("Wealth Quintile ", 1:5, sep = ""), "Overall"))
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      temp$estimate <- temp$estimate * 100
      }
    #
    #
    #
    merge(dhaka.map, temp, by.x = "surveyArea", by.y = "strata")
  })
  #
  #
  #
  output$panel.header <- reactive({
    #
    #
    #
    paste(input$city, ", ", input$country, sep = "")
  })
  #
  #
  #
  output$indicator.header <- reactive({
    #
    #
    #
    paste(steerIndicators$varNames[steerIndicators$varList == input$varList])
  })
  #
  #
  #
  output$year.header <- reactive({
    #
    #
    #
    if(input$start.year == input$end.year)
      {
      paste(input$start.year, sep = "")
      }
    #
    #
    #
    else
      {
      paste(input$start.year, " - ", input$end.year, sep = "")
      }
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.map.data()[[input$varList]], city.map.data()[[input$varList]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval"),
                        selected = "interval")
    #
    #
    #
    if(class(xx) != "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       


################################################################################
#
# Dynamic UI
#
################################################################################
  #
  #
  #
  output$overall.estimate <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
	  			   strata == "Overall" & 
				   type == "Citywide")
    #
    #
    #
    estimate <- paste(round(temp$estimate[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%", sep = "")
    #
    # If varList is not proportion...
    #
    if(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
	  {
	  #
	  #
	  #
	  estimate <- paste(round(temp$estimate[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1), sep = "")
	  }
    #
    #
    #
    estimate
  })
  #
  #
  #
  output$ci.estimate <- reactive({
    #
    #
    #
    temp <- subset(sub.data(),
                   strata == "Overall" &
                   type == "Citywide")
    #
    #
    #
    ci <- paste("95% CI: ", 
                round(temp$LCL[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%",
                " - ",
                round(temp$UCL[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%",
                sep = "")
    #
    #
    #
    if(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      ci <- paste("95% CI: ", 
                  round(temp$LCL[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1),
                  " - ",
                  round(temp$UCL[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1),
                  sep = "")
      }
    #
    #
    #
    ci
  })
    

################################################################################
#
# Plot indicators
#
################################################################################
  #
  #
  #
  output$bar.plot <- renderPlot({
  #
  #
  #
  if(input$group.by != "." | input$facet.by != ".")
    {
    #
    #
    #
    temp <- subset(sub.data(), 
                   strata == "Overall" & 
                   type == "Citywide")
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = ""))
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = ""))
      } 
    #
    #
    #
    if(input$group.by == "." & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata == "Overall")
      } 
    #
    #
    #
    basePlot <- ggplot(data = temp,
                       mapping = aes(x = strata,
                                     y = estimate))
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", 
                        position = "dodge",
                        alpha = 0.6,
                        fill = wsupColour,
                        colour = wsupColour)
    #
    #
    #
    barCI <- geom_crossbar(mapping = aes(ymin = LCL, ymax = UCL), 
                           width = 0.5, 
                           size = 0.75, 
                           fatten = 3, 
                           colour = errorColour)
    #
    #
    #
    if(input$facet.by != ".")
      {
      #
      #
      #
      barFacet <- facet_grid(facets = . ~ type)
      }
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$varList %in% c("water12", "san14") & input$country == "Bangladesh", "Bangladesh Taka (BDT)", 
                         ifelse(input$varList == "san13", "Time (minutes)", 
                           ifelse(input$varList == "pQuintile", "Quintiles", 
                             ifelse(input$varList == "nMembers", "No. of Household Members", "Proportion")))))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$group.by == "surveyArea", "Survey Area",
                         ifelse(input$group.by == "wealth", "Wealth Quintile",
                           ifelse(input$facet.by == "type", "Area Type", ""))))
    #
    #
    #
    indicator.plot <- basePlot + barPlot + theme_wsup + yLabel + xLabel
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,1))
      }
    #
    #
    #
    if(input$varList == "ppi")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,100))
      }
    #
    #
    #
    if(input$varList == "pQuintile")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,5))
      }
    #
    #
    #  
    if(input$facet.by != ".")
      {
      #
      # 
      #
      indicator.plot <- indicator.plot + barFacet
      }
    #
    #
    #
    if(input$group.by != ".")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
      }
    #
    #
    #
    if(input$error.bar)
      {
      #
      #
      #
      indicator.plot <- indicator.plot + barCI
      }
    #
    # 
    #
    print(indicator.plot)
    }
  #
  #
  #
  }, height = 320)                    
  #
  # Ladder Plots
  #
  output$ladder.plot <- renderPlot({
  #
  # 
  if(input$varSet %in% c("waterSet1", "sanSet1", "handSet", "overallSet1") & input$varList == ".")
    {
    #
    #
    #
    temp <- subset(ladder.data(), 
                   strata == "Overall" & 
                   type == "Citywide")
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = ""))
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = ""))
      } 
    #
    #
    #
    if(input$group.by == "." & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata == "Overall")
      } 
    #
    #
    #
    basePlot <- ggplot(data = temp,
                       mapping = aes(x = strata,
                                     y = estimate,
                                     fill = rev(indicatorCode)))
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", 
                        position = "fill",
                        alpha = 0.6)
    #
    #
    #
    if(input$varSet == "waterSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Drinking Water Ladder",
                                   labels = c("Safely-managed",
                                              "Basic",
                                              "Limited",
                                              "Unimproved",
                                              "Surface Water"),
                                   values = waterLadder)
      }
    #
    #
    #
    if(input$varSet == "sanSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Sanitation Ladder",
                                   labels = c("Safely-managed",
                                              "Basic",
                                              "Limited",
                                              "Unimproved",
                                              "Open defecation"),
                                   values = sanitationLadder)
      }
    #
    #
    #
    if(input$varSet == "handSet")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Handwashing Ladder",
                                   labels = c("Basic",
                                              "Limited",
                                              "No facility"),
                                   values = handwashLadder)
      }
    #
    #
    #
    if(input$varSet == "overallSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Services Access",
                                   labels = c("Adequate water and sanitation",
                                              "Adequate water only",
                                              "Adequate sanitation only",
                                              "No access to adequate services"),
                                   values = rev(overallColour))
      }
    #
    #
    #
    if(input$facet.by != ".")
      {
      #
      #
      #
      barFacet <- facet_grid(facets = . ~ type)
      }
    #
    # y-axis labels
    #
    yLabel <- labs(y = "Proportion")
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$group.by == "surveyArea", "Survey Area",
                         ifelse(input$group.by == "wealth", "Wealth Quintile",
                           ifelse(input$facet.by == "type", "Area Type", ""))))
    #
    #
    #
    ladder.plot <- basePlot + barPlot + barFill + theme_wsup + xLabel + yLabel
    #
    #
    #  
    if(input$facet.by != ".")
      {
      #
      # 
      #
      ladder.plot <- ladder.plot + barFacet
      }
    #
    #
    #
    if(input$group.by != ".")
      {
      #
      #
      #
      ladder.plot <- ladder.plot + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
      }
    #
    #
    #
    print(ladder.plot)
    }
  #
  #
  #
  }, height = 350)
  #
  #
  #
  survey.area.map <- reactive({
    #
    # If selected country is Bangladesh and selected city is Dhaka
    #
    if(input$country == "Bangladesh" & input$city == "Dhaka"){
      #
      #
      #
      inputFile <- input$shp.dhaka
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { 
        dhaka.map
      }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
                 layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
                 verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error") { 
        NULL 
      } 
      else {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
      }
    }
  })
  #
  #
  #
  observeEvent(input$shp.dhaka, {
    updateSelectInput(session = session,
                      inputId = "survey.area.id",
                      label = "Select map data identifier for survey areas",
                      choices = names(survey.area.map()))
  })  
  #
  # Map baselayer
  #  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(
        urlTemplate = mapbox.standard,
        attribution = "Maps by <a href = 'http://www.mapbox.com/'>Mapbox</a>"
      ) %>%
      #addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
      setView(lng = 20, lat = 20, zoom = 3)
  })
  #
  # Get map centre and/or bounds of selected country
  #
  survey.country <- reactive({
    #
    #
    #
    if(input$country != ".") {
      #
      #
      #
      geocode(input$country, output = "more")
    }
  })
  #
  # Get map centre and/or bounds of selected city
  #
  survey.city <- reactive({
    #
    #
    #
    if(input$city != ".") {
      #
      #
      #
      geocode(input$city, output = "more")
    }
  })
  #
  # Zoom in to selected country
  #
  observe({
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    fitBounds(lng1 = survey.country()$east, lat1 = survey.country()$north,
  		      lng2 = survey.country()$west, lat2 = survey.country()$south)
  })    
  #
  # Zoom in to selected city
  #
  observe({
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    fitBounds(lng1 = survey.city()$east, lat1 = survey.city()$north,
  		      lng2 = survey.city()$west, lat2 = survey.city()$south)
  }) 
  #
  # Zoom in to selected city
  #
  observeEvent(input$varSet != input$varSet, {
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    clearShapes() %>%
    #
    #
    #
    clearControls()
  }) 
  #
  # Plot indicator maps
  #   
  observe({
    #
    #
    #
    if(input$varList != ".")
      {
	  #
	  # 
 	  #
	  if(input$map.colour == "linear")
	    {
	    #
	    #
	    #
	    values <- c(0, max(c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])))      
	    #
	    #
	    #
	    pal <- colorNumeric(palette = input$map.palette,
		  				    domain = values)
	    }
	  #
	  #
	  #
	  if(input$map.colour == "interval")
	    {
	    #
	    #
	    #
	    values <- c(0, max(c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])))
	    #
	    #
	    #
	    pal <- colorBin(palette = input$map.palette, 
					    domain = values,
					    pretty = TRUE,
					    bins = ifelse(is.null(input$map.bins), 5, input$map.bins))
	    }
	  #
	  #
	  #
	  if(input$map.colour == "quantile")
	    {
	    #
	    #
	    #
	    pal <- colorQuantile(palette = input$map.palette,
		   				     domain = c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]]),
						     n = ifelse(is.null(input$map.quantiles), 5, input$map.quantiles))
	    #
	    #
	    #
	    values <- c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])
	    }
	  #
	  #
	  #  
	  slum.labels <- paste(slum.map.data()$surveyArea, ": ", round(slum.map.data()[["estimate"]], digits = 1), sep = "")
	  city.labels <- paste(city.map.data()$surveyArea, ": ", round(city.map.data()[["estimate"]], digits = 1), sep = "")
	  #upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
	  #ward.labels <- paste("Ward: ", wards$Union, sep = "") 
	  #
	  #
	  #
	  leafletProxy("map") %>%
	  #
	  #
	  #
	  clearShapes() %>%
	  #
	  #
      #
      clearControls() %>%
	  #
	  # Slum polygon
 	  #
	  addPolygons(
	    data = slum.map.data(),
	    fillColor = pal(slum.map.data()[["estimate"]]),
	    weight = 2,
	    opacity = 1,
	    color = "white",
	    dashArray = "",
	    fillOpacity = 0.7,
	    highlight = highlightOptions(
		  weight = 5,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0.7,
		  bringToFront = TRUE),
	    label = slum.labels,
	    labelOptions = labelOptions(
		  style = list("font-weight" = "normal", padding = "3px 8px"),
		  textsize = "12px",
		  direction = "auto"),
	    group = "Slum") %>%
	  #
	  # Citywide polygon
	  #
	  addPolygons(
	    data = city.map.data(),
	    fillColor = pal(city.map.data()[["estimate"]]),
	    weight = 2,
	    opacity = 1,
	    color = "white",
	    dashArray = "",
	    fillOpacity = 0.7,
	    highlight = highlightOptions(
		  weight = 5,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0.7,
		  bringToFront = TRUE),
	    label = city.labels,
	    labelOptions = labelOptions(
		  style = list("font-weight" = "normal", padding = "3px 8px"),
		  textsize = "12px",
		  direction = "auto"),
	    group = "Citywide") %>%
	  #
	  #
	  #
	  addLegend(pal = pal, values = values, opacity = 0.7,
		position = "bottomright", 
		labFormat = ifelse(input$map.colour == "quantile" & !input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), legend.format(digits = 1, between = " to ", suffix = "%"),
		              ifelse(input$map.colour == "quantile" & input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), legend.format(digits = 1, between = " to "),
		                ifelse(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), labelFormat(digits = 1, between = " to "), labelFormat(digits = 1, between = " to ", suffix = "%")))),
		#title = steerIndicators$varShort[steerIndicators$varList == input$varList],
		layerId = "legend") %>%
	  #
	  #
	  #
	  addLayersControl(
		baseGroups = c("Slum", "Citywide"),
		#overlayGroups = c("Upazila", "Wards"),
		position = "topleft",
		options = layersControlOptions(collapsed = FALSE, autoZIndex = TRUE)) #%>%
	  #
	  #
	  #
	  #addMiniMap(tiles = mapbox.satellite,
	  #  toggleDisplay = TRUE,
	  #	position = "topleft",
	  #	width = 150, height = 150)
    }
  })
  
  
################################################################################
#
# Sample size function
#
################################################################################
  #
  #
  #
  sample.df <- reactive({
    #
    #
    #
    inputFile <- input$file2
    #
    #
    #
    if(is.null(inputFile))
      {
      #
      #
      #
      return(NULL)
      }
    #
    #
    #
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })    

  #
  #
  #
  observe({
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "variable",
                        label = "Select variable name of indicator to test",
                        choices = names(sample.df()))
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "cluster",
                        label = "Select variable name of survey cluster",
                        choices = names(sample.df()))
  })
  #
  #
  #
  observeEvent(input$calculate1, {
	  #
	  #
	  #
	  z.value <- ifelse(input$z.ci == "1.96", "95% CI",
			   	   ifelse(input$z.ci == "1.75", "92% CI",
				     ifelse(input$z.ci == "1.645", "90% CI", "96% CI")))
	  #
	  # Calculate sample size
	  #
	  sample.size1 <- (as.numeric(input$z.ci) ^ 2) * (((input$proportion / 100) * (1 - (input$proportion / 100))) / ((input$precision / 100) ^ 2))
	  #    
	  # Compose data frame
	  #
	  sample.parameters <- data.frame(Parameters = c("z-value", 
													 "Prevalence",
													 "Precision",
													 "Sample size"),
									  Value = as.character(c(paste(input$z.ci, " (", z.value, ")", sep = "") , 
										 					 paste(input$proportion, "%", sep = ""),
															 paste(input$precision, "%", sep = ""),
															 ceiling(sample.size1))), 
									  stringsAsFactors = FALSE)
      #
      #
      #
      output$sample.header <- renderText({
        #
        #
        #
        "Sample size parameters and estimate (SRS)"
      })
	  #
	  #
	  #
	  output$sample <- renderTable({
	    #
	    #
        #
		sample.parameters
	  })
  })
  #
  #
  #
  observeEvent(input$reset1, {
      #
      #
      #
      output$sample.header <- renderText({NULL})
      #
      #
      #
      output$sample <- renderTable({NULL})
      #
      #
      #
      shinyjs::reset("sample-size")
  })
  #
  #
  #
  observeEvent(input$surveyType == "cluster", {
      #
      #
      #
      output$sample.header <- renderText({NULL})
      #
      #
      #
      output$sample <- renderTable({NULL})
  })
  #
  #
  #
  observeEvent(input$calculate2, {
      #
      # Assign deff
      #
      design.effect <- 5
	  #
	  # Calculate deff
	  #
	  if(!is.null(input$file2))
	    {
	    #
        # Design effect
        #
	    #design.effect <- deff(y = sample.df()[[input$variable]], cluster = sample.df()[[input$cluster]])[["deff"]]
	    #
	    #
	    #
	    icc <- deff(y = sample.df()[[input$variable]], cluster = sample.df()[[input$cluster]])[["rho"]]
	    #
	    #
	    #
	    design.effect <- 1 + (input$cluster.size - 1) * icc
	    }
	  #
	  #
	  #
	  z.value <- ifelse(input$z.ci == "1.96", "95% CI",
			   	   ifelse(input$z.ci == "1.75", "92% CI",
				     ifelse(input$z.ci == "1.645", "90% CI", "96% CI")))
	  #
	  # Calculate sample size
	  #
	  sample.size2 <- design.effect * (as.numeric(input$z.ci) ^ 2) * (((input$proportion / 100) * (1 - (input$proportion / 100))) / ((input$precision / 100) ^ 2))
	  #    
	  # Compose data frame
	  #
	  deff.parameters <- data.frame(Parameters = c("z-value", 
												   "Prevalence",
												   "Precision",
												   "Cluster size",
												   "ICC",
												   "Design effect of planned survey",
												   "Sample size"),
									Value = as.character(c(paste(input$z.ci, " (", z.value, ")", sep = "") , 
										 				   paste(input$proportion, "%", sep = ""),
														   paste(input$precision, "%", sep = ""),
									                       paste(input$cluster.size, "samples per cluster", sep = " "),
									                       ifelse(is.null(input$file2), "No data", round(icc, digits = 4)), 
								                           ifelse(is.null(input$file2), paste(design.effect, "(assumed)", sep = " "), paste(round(design.effect, digits = 4), "(based on data)", sep = " ")),
								                           ceiling(sample.size2))),
                                    stringsAsFactors = FALSE)      
      #
      #
      #
      output$deff.header <- renderText({
        #
        #
        #
        "Sample size parameters and estimate (Cluster Sample)"
      })
	  #
	  #
	  #
	  output$deff <- renderTable({
	    #
	    #
        #
		deff.parameters
	  })
  })
  #
  #
  #
  observeEvent(input$reset2, {
      #
      #
      #
      output$deff.header <- renderText({NULL})
      #
      #
      #
      output$deff <- renderTable({NULL})
  })
################################################################################
#
# Spatial sampling
#
################################################################################
  #
  #
  #
  output$map.sampling <- renderLeaflet({
    leaflet() %>%
      #addTiles(
      #  urlTemplate = mapbox.northstar,
      #  attribution = "Maps by <a href='http://www.mapbox.com/'>Mapbox</a>"
      #) %>%
      addProviderTiles(providers$Esri.NatGeoWorldMap) %>%      
      setView(lng = 0, lat = 0, zoom = 2)
  })

################################################################################
#
# Read shapefile
#
################################################################################
  #
  #
  #
  city.map <- reactive({
    #
    #
    #
    inputFile <- input$shp1
    #
    #
    #
    if(is.null(inputFile)) { return(NULL) }
    #
    #
    #  
    infiles <- inputFile$datapath
    #
    #
    #
    dir <- unique(dirname(infiles))
    #
    #
    #
    outfiles <- file.path(dir, inputFile$name)
    #
    #
    #
    purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
    #
    #
    #
    x <- try(readOGR(dir, strsplit(inputFile$name[1], "\\.")[[1]][1]), TRUE)
    #
    #
    #
    if(class(x) == "try-error") NULL 
    #
    #
    #
    else
    #
    # Transform shapefiles into WGS84 longlat
    #
    x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
  })
  #
  #
  #
  slum.map <- reactive({
    #
    #
    #
    inputFile <- input$shp2
    #
    #
    #
    if(is.null(inputFile)) { return(NULL) }
    #
    #
    #  
    infiles <- inputFile$datapath
    #
    #
    #
    dir <- unique(dirname(infiles))
    #
    #
    #
    outfiles <- file.path(dir, inputFile$name)
    #
    #
    #
    purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
    #
    #
    #
    x <- try(readOGR(dir, strsplit(inputFile$name[1], "\\.")[[1]][1]), TRUE)
    #
    #
    #
    if(class(x) == "try-error") NULL 
    #
    #
    #
    else
    #
    # Transform shapefiles into WGS84 longlat
    #
    x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
  })

  #
  #
  #
  observeEvent(input$mapDraw1, {
      #
      #
      #
      leafletProxy("map.sampling") %>%
      #
      #
      #
      clearTiles() %>%
      #
      #
      #
      clearShapes() %>%
      #
      #
      #
      clearMarkers() %>%
      #
      #
      #
      addTiles(
        urlTemplate = mapbox.satellite,
        attribution = "Imagery by <a href='https://www.mapbox.com'>Mapbox</a>"
      ) %>%
      #
      #
      #
      fitBounds(lng1 = bbox(city.map())[1,1], 
                lat1 = bbox(city.map())[2,1], 
                lng2 = bbox(city.map())[1,2], 
                lat2 = bbox(city.map())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = city.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = FALSE),
		group = "Survey Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
  })    
  #
  #
  #
  observeEvent(input$mapDraw2, {
      #
      #
      #
      leafletProxy("map.sampling") %>%
      #
      #
      #
      clearTiles() %>%
      #
      #
      #
      clearShapes() %>%
      #
      #
      #
      clearMarkers() %>%
      #
      #
      #
      addTiles(
        urlTemplate = mapbox.satellite,
        attribution = "Imagery by <a href='https://www.mapbox.com'>Mapbox</a>"
      ) %>%
      #
      #
      #
      #setView(lng = mean(coordinates(slum.map())[,1]), 
      #        lat = mean(coordinates(slum.map())[,2]), 
      #        zoom = 11) %>%
      fitBounds(lng1 = bbox(slum.map())[1,1], 
                lat1 = bbox(slum.map())[2,1], 
                lng2 = bbox(slum.map())[1,2], 
                lat2 = bbox(slum.map())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = slum.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = FALSE),
		group = "Slum Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Slum Areas"),
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
  })
  #
  #
  #
  observeEvent(input$shp1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.city.area",
                      label = "Select map data identifier for city survey areas",
                      choices = names(city.map()))
  })
  #
  #
  #
  observeEvent(input$shp2, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.slum.area1",
                      label = "Select map data identifier for slum survey areas",
                      choices = names(slum.map()))
  })
  #
  #
  #
  observeEvent(input$list1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.slum.area2",
                      label = "Select map data identifier for slum survey areas",
                      choices = names(sample.list.df()))
  })
  #
  #
  #
  observeEvent(input$var.city.area, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "city.area.name",
                      label = "Select city area",
                      choices = levels(city.map()[[input$var.city.area]]))
  })
  #
  #
  #
  observeEvent(input$var.slum.area1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "slum.area.name1",
                      label = "Select slum area",
                      choices = levels(slum.map()[[input$var.slum.area1]]))
  })
  #
  #
  #
  observeEvent(input$var.slum.area2, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "slum.area.name2",
                      label = "Select slum area",
                      choices = levels(sample.list.df()[[input$var.slum.area2]]))
  })
  #
  #
  #
  output$map.draw.control1 <- renderUI({
    #
    #
    #
    if(!is.null(input$shp1))
      {
      #
      #
      #
      actionButton(inputId = "mapDraw1",
                   label = "Map",
                   class = "btn-primary",
                   icon = icon(name = "map", class = "fa-lg"))
      }
  })
  #
  #
  #
  output$map.draw.control2 <- renderUI({
    #
    #
    #
    if(!is.null(input$shp2))
      {
      #
      #
      #
      actionButton(inputId = "mapDraw2",
                   label = "Map",
                   class = "btn-primary",                   
                   icon = icon(name = "map", class = "fa-lg"))
      }
  })
  #
  #
  #
  xGrid <- eventReactive(input$sample.city, {
	#
	# Subset to current survey area
	#
	temp <- subset(city.map(), get(input$var.city.area) == input$city.area.name)
	#
	# Grid current area
	#
	repeat
	  {
	  #
	  # Spatial sample
	  #
	  xSP <- spsample(x = temp, 
					  n = input$n.psu.citywide, 
					  type = "regular")
	  #
	  # Check if there are enough grids
	  #
	  if(length(xSP) == input$n.psu.citywide) break
	  }  
	  #
	  # Create identifiers
	  #
	  areaID    <- rep(input$city.area.name, length(xSP))
	  quadratID <- 1:length(xSP)
	  longitude <- xSP@coords[ , 1] 
	  latitude  <- xSP@coords[ , 2]
	  #
	  #
	  #
	  xGrid <- as(as(xSP, "SpatialPixels"), "SpatialPolygons")
	  #
	  #
	  #
	  xGrid <- SpatialPolygonsDataFrame(Sr = xGrid,
										data = data.frame(areaID, quadratID, longitude, latitude),
										match.ID = FALSE)
  })				
  #
  # 
  #
  output$city.grid.table <- DT::renderDataTable(DT::datatable({
	#
	#
    #
    xGrid()@data
  }))
  #
  #
  #
  output$city.download1 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("cityList", input$city.area.name, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(xGrid()@data, file)
    }
  )
  #
  #
  #
  output$download.city <- renderUI({
    #
    #
    #
    if(input$sample.city)
      #
      #
      #
      downloadButton(outputId = "city.download1",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
  #
  #
  #
  observeEvent(xGrid(), {
       #
       #
       #
       leafletProxy("map.sampling") %>%
       #
       #
       #
       clearShapes() %>%
       #
       #
       #
       clearMarkers() %>%
       #
       #
       #
       clearControls() %>%
       #
       #
       #
       #setView(lng = mean(coordinates(xGrid())[,1]), 
       #        lat = mean(coordinates(xGrid())[,2]), 
       #        zoom = 13) %>%
      fitBounds(lng1 = bbox(xGrid())[1,1], 
                lat1 = bbox(xGrid())[2,1], 
                lng2 = bbox(xGrid())[1,2], 
                lat2 = bbox(xGrid())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = city.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = TRUE),
		group = "Survey Areas") %>%
       #
       # Add survey area polygon layer
       #
	   addPolygons(
	     data = xGrid(),
	     weight = 3,
	     opacity = 1,
	     color = "blue",
	     dashArray = "",
	     fillOpacity = 0,
	     highlight = highlightOptions(
		   weight = 4,
		   color = "#666",
		   dashArray = "",
		   fillOpacity = 0,
		   bringToFront = TRUE),
		  group = paste(input$city.area.name, "grids", sep = " ")) %>%
		#
		#
		#
		addCircleMarkers(
		  data = xGrid(),
		  lng =  coordinates(xGrid())[,1],
		  lat = coordinates(xGrid())[,2],
		  radius = 1,
		  fill = TRUE,
		  fillColor = "red",
		  fillOpacity = 0.8,
		  color = "red",
		  group = paste(input$city.area.name, "sampling points", sep = " ")) %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          overlayGroups = c(paste(input$city.area.name, "grids", sep = " "), paste(input$city.area.name, "sampling points", sep = " ")),
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
  })         
  #
  #
  #
  sGrid <- eventReactive(input$sample.slum1, {
	#
	# Subset to current survey area
	#
	temp <- subset(slum.map(), get(input$var.slum.area1) == input$slum.area.name1)
	#
	# Grid current area
	#
	repeat
	  {
	  #
	  # Spatial sample
	  #
	  xSP <- spsample(x = temp, 
					  n = input$n.psu.slum, 
					  type = "regular")
	  #
	  # Check if there are enough grids
	  #
	  if(length(xSP) == input$n.psu.citywide) break
	  }  
	  #
	  # Create identifiers
	  #
	  areaID    <- rep(input$slum.area.name1, length(xSP))
	  quadratID <- 1:length(xSP)
	  longitude <- xSP@coords[ , 1] 
	  latitude  <- xSP@coords[ , 2]
	  #
	  #
	  #
	  sGrid <- as(as(xSP, "SpatialPixels"), "SpatialPolygons")
	  #
	  #
	  #
	  sGrid <- SpatialPolygonsDataFrame(Sr = sGrid,
										data = data.frame(areaID, quadratID, longitude, latitude),
										match.ID = FALSE)
  })				
  #
  # 
  #
  output$slum.grid.table <- DT::renderDataTable(DT::datatable({
	#
	#
    #
    sGrid()@data
  }))
  #
  #
  #
  output$slum.download1 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("slumList", input$slum.area.name1, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(sGrid()@data, file)
    }
  )
  #
  #
  #
  output$download.slum1 <- renderUI({
    #
    #
    #
    if(input$sample.slum1)
      #
      #
      #
      downloadButton(outputId = "slum.download1",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
  #
  #
  #
  observeEvent(sGrid(), {
       #
       #
       #
       leafletProxy("map.sampling") %>%
       #
       #
       #
       clearShapes() %>%
       #
       #
       #
       clearMarkers() %>%
       #
       #
       #
       clearControls() %>%
       #
       #
       #
       #setView(lng = mean(coordinates(sGrid())[,1]), 
       #        lat = mean(coordinates(sGrid())[,2]), 
       #        zoom = 13) %>%
      fitBounds(lng1 = bbox(sGrid())[1,1], 
                lat1 = bbox(sGrid())[2,1], 
                lng2 = bbox(sGrid())[1,2], 
                lat2 = bbox(sGrid())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = slum.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = TRUE),
		group = "Survey Areas") %>%
       #
       # Add survey area polygon layer
       #
	   addPolygons(
	     data = sGrid(),
	     weight = 3,
	     opacity = 1,
	     color = "blue",
	     dashArray = "",
	     fillOpacity = 0,
	     highlight = highlightOptions(
		   weight = 4,
		   color = "#666",
		   dashArray = "",
		   fillOpacity = 0,
		   bringToFront = TRUE),
		  group = paste(input$slum.area.name1, "grids", sep = " ")) %>%
		#
		# Add centroids
		#
		addCircleMarkers(
		  data = sGrid(),
		  lng =  coordinates(sGrid())[,1],
		  lat = coordinates(sGrid())[,2],
		  radius = 1,
		  fill = TRUE,
		  fillColor = "red",
		  fillOpacity = 0.8,
		  color = "red",
		  group = paste(input$slum.area.name1, "sampling points", sep = " ")) %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          overlayGroups = c(paste(input$slum.area.name1, "grids", sep = " "), paste(input$slum.area.name1, "sampling points", sep = " ")),
          position = "topleft",
          options = layersControlOptions(collapsed = FALSE)) %>%		      
        #
        # Keep baselayers at base of map
        #
        htmlwidgets::onRender("
          function(el, x) {
            this.on('baselayerchange', function(e) {
              e.layer.bringToBack();
            })
          }
        ")
  })         
  #
  #
  #
  sample.list.df <- reactive({
    #
    #
    #
    inputFile <- input$list1
    #
    #
    #
    if(is.null(inputFile))
      {
      #
      #
      #
      return(NULL)
      }
    #
    #
    #
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })    
  #
  #
  #
  sample.slum.list <- eventReactive(input$sample.slum2, {
	  #
	  #
	  #
      temp <- subset(sample.list.df(), get(input$var.slum.area2) == input$slum.area.name2)
	  #
	  #
	  #
	  stepInterval <- floor(nrow(temp) / input$n.psu.slum)
      #
	  #
	  #
	  startPoint <- sample(x = 1:input$n.psu.slum, size = 1, replace = FALSE)
	  #
	  #
	  #
	  selectList <- seq(from = startPoint, to = nrow(temp), by = stepInterval)
	  #
	  #
	  #
	  sample.slum.list <- temp[selectList, ]
  })
  #
  #
  #
  output$sample.slum.table <- DT::renderDataTable(DT::datatable({
	#
	#
	#
	sample.slum.list()
  }))
  #
  #
  #
  output$slum.download2 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("slumList", input$slum.area.name2, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(sample.slum.list(), file)
    }
  )
  #
  #
  #
  output$download.slum2 <- renderUI({
    #
    #
    #
    if(input$sample.slum2)
      #
      #
      #
      downloadButton(outputId = "slum.download2",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
  #
  #
  #
  observeEvent(input$warning1, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
  #
  #
  #
  observeEvent(input$warning2, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
  #
  #
  #
  observeEvent(input$warning3, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
}