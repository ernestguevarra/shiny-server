
################################################################################
#
# Server function
#
################################################################################
#
#
#
function(input, output, session) {
  #
  # Determine which country has been selected
  # 
  observe({
    #
    #
    #
    if(input$country1 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country1 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country1 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country1 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country1 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country1 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Lusaka" = "LUN"))
  })
  #
  # Determine which country has been selected - set 2
  # 
  observe({
    #
    #
    #
    if(input$country2 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country2 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country2 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country2 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country2 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country2 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Lusaka" = "LUN"))
  })  
  #
  # Determine which country has been selected - set 3
  # 
  observe({
    #
    #
    #
    if(input$country3 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country3 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country3 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country3 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country3 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country3 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Lusaka" = "LUN"))
  })
  #
  # Determine which country has been selected - set 4
  # 
  observe({
    #
    #
    #
    if(input$country4 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country4 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country4 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country4 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country4 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country4 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Lusaka" = "LUN"))
  })  
  #
  # Determine which country has been selected - set 5
  # 
  observe({
    #
    #
    #
    if(input$country5 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country5 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country5 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country5 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country5 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country5 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Lusaka" = "LUN"))
  })
  #
  # Determine which country has been selected - set 6
  # 
  observe({
    #
    #
    #
    if(input$country6 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country6 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country6 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country6 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country6 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country6 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Lusaka" = "LUN"))
  })
  #
  # Determine which country has been selected - set 7
  # 
  observe({
    #
    #
    #
    if(input$country7 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Dhaka" = "DAC"))
    #
    #
    #
    if(input$country7 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Accra" = "ACC"))    
    # 
    #
    #
    if(input$country7 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Nakuru" = "NUU"))    
    #
    #
    #
    if(input$country7 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Antananarivo" = "TNR"))    
    #
    #
    #
    if(input$country7 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Maputo" = "MPM"))
    #
    #
    #
    if(input$country7 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Lusaka" = "LUN"))
  })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.ladder == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Area Type" = "type"))
      #
      #
      #
      if(input$x.ladder == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.ladder == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = "."))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.overall == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Area Type" = "type"))
      #
      #
      #
      if(input$x.overall == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.overall == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = "."))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.water == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.water == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.water == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.sanitation == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.sanitation == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".",
                                      "Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.sanitation == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })
  observe({
      #
      #
      #
      if(input$x.hygiene == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.hygiene == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.hygiene == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })



################################################################################
#
# Get data
#
################################################################################
  #
  # Get data for histograms for nMembers
  #
  indicatorsDataset <- reactive({
    #
    # Subset to selected country
    #
    indicatorsDF[indicatorsDF$country1 == input$country1, ]        
    })
  #
  # Get data for service ladders - survey area
  #
  area.ladder <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country3 & areaResultsLong$indicatorCategory == input$z.ladder, ]
    })
  #
  # Get data for service ladders - wealth
  #
  wealth.ladder <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country3 & wealthResultsLong$indicatorCategory == input$z.ladder, ]        
    })
  #
  # Get data for poverty - survey area
  #
  area.poverty <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country2 & areaResultsLong$indicatorCategory == input$z.poverty, ]
    })
  #
  # Get data for poverty - wealth
  #
  wealth.poverty <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country2 & wealthResultsLong$indicatorCategory == input$z.poverty, ]        
    })
  #
  # Get data for overall - survey area
  #
  area.overall <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country7 & areaResultsLong$indicatorCategory == input$z.overall, ]
    })
  #
  # Get data for poverty - wealth
  #
  wealth.overall <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country7 & wealthResultsLong$indicatorCategory == input$z.overall, ]        
    })
  #
  # Get data for water - survey area
  #
  area.water <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country4 & areaResultsLong$indicatorCode == input$z.water, ]
    })
  #
  # Get data for water - wealth
  #
  wealth.water <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country4 & wealthResultsLong$indicatorCode == input$z.water, ]        
    })
  #
  # Get data for sanitation - survey area
  #
  area.sanitation <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country5 & areaResultsLong$indicatorCode == input$z.sanitation, ]
    })
  #
  # Get data for sanitation - wealth
  #
  wealth.sanitation <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country5 & wealthResultsLong$indicatorCode == input$z.sanitation, ]        
    })
   #
  # Get data for hygiene - survey area
  #
  area.hygiene <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country6 & areaResultsLong$indicatorCode == input$z.hygiene, ]
    })
  #
  # Get data for hygiene - wealth
  #
  wealth.hygiene <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country6 & wealthResultsLong$indicatorCode == input$z.hygiene, ]        
    })
    
    
################################################################################
#
#
#
# Plot indicator charts
#
#
#
################################################################################
 
################################################################################
#
# Plot Demographics
#
################################################################################
  #
  # Demographics
  #
  output$demographics <- renderPlot({
    #
    # Create ggplot mapping base
    #
    baseHist <- ggplot(data = indicatorsDF, mapping = aes(x = nMembers))
    #
    # Layers
    #
    histPlot <- geom_histogram(binwidth = 1, color = wsupColour, fill = wsupColour, alpha = 0.6)
    #
    #
    #
    allPlot <- baseHist + histPlot + theme_wsup + labs(x = "Number of Household Members", y = "")
    #
    #
    #
    if(input$x.demographics == "zone")
      #
      #
      #
      facet.demo <- facet_wrap( ~ zone, labeller = labeller(zone = addArea))
    #
    #
    #
    if(input$x.demographics == "type")
      #
      #
      #
      facet.demo <- facet_wrap( ~ type)
    #
    #
    #
    if(input$x.demographics == "pQuintile")
      #
      #
      #
      facet.demo <- facet_wrap( ~ pQuintile, labeller = labeller(pQuintile = addWealth))    
    #
    #
    #
    if(input$x.demographics != ".")
      #
      #
      #
      allPlot <- allPlot + facet.demo
    #
    #
    #
    print(allPlot)
  #
  #
  #
  }, height = 700)



################################################################################
#
# Plot Poverty
#
################################################################################
  #
  # Poverty
  #
  output$poverty <- renderPlot({
    #
    # Create ggplot mapping base
    #
    basePoverty <- ggplot(data = indicatorsDF, mapping = aes(x = get(input$z.poverty)))
    #
    #
    #
    binwidth <- ifelse(input$z.poverty != "ppp125", 1, 0.1)
    #
    # Layers
    #
    povertyPlot <- geom_histogram(binwidth = binwidth, 
                                  color = wsupColour, 
                                  fill = wsupColour, 
                                  alpha = 0.6)
    #
    #
    #
    labs <- ifelse(input$z.poverty == "ppi", "PPI Score",
              ifelse(input$z.poverty == "ppp125", "Poverty Likelihood ($1.25 a day)", "Wealth Quintile")) 
    #
    #
    #
    allPlot <- basePoverty + povertyPlot + theme_wsup + labs(x = labs, y = "")
    #
    #
    #
    if(input$x.poverty == "zone")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ zone, labeller = labeller(zone = addArea))
    #
    #
    #
    if(input$x.poverty == "type")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ type)
    #
    #
    #
    if(input$x.poverty == "pQuintile")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ pQuintile, labeller = labeller(pQuintile = addWealth))    
    #
    #
    #
    if(input$x.poverty != ".")
      #
      #
      #
      allPlot <- allPlot + facet.poverty
    #
    #
    #
    print(allPlot)
  #
  #
  #
  }, height = 700)



################################################################################
#
# Plot Service Ladders
#
################################################################################
  #
  # 
  #
  output$ladder <- renderPlot({
    #
    #
    #
    if(input$x.ladder == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.ladder(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))
    #
    #
    #
    if(input$x.ladder == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.ladder(),
                         mapping = aes_string(x = input$x.ladder,
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    if(input$x.ladder == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.ladder(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", position = "fill", alpha = 0.8)
    #
    #
    #
    if(input$z.ladder == "waterSet1")
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
    if(input$z.ladder == "sanSet1")
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
    if(input$z.ladder == "handSet")
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
    if(input$z.ladder == "overallSet1")
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
    # Facets - type and surveyArea
    #
    if(input$x.ladder == "type" & input$y.ladder == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if((input$x.ladder == "surveyArea" | input$x.ladder == "wealth") & input$y.ladder == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.ladder))
    #
    # x-axis labels
    #
    xLabel <- labs(y = "Proportion")
    #
    # y-axis label for surveyArea
    #
    if(input$x.ladder == "surveyArea") yLabel <- labs(x = "Survey Area")
    #
    # y-axis label for type
    #
    if(input$x.ladder == "type") yLabel <- labs(x = "Area Type")    
    #
    # y-axis label for wealthQuintile
    #
    if(input$x.ladder == "wealth") yLabel <- labs(x = "Wealth Quintile")    
    #
    # Create plot
    #
    p <- basePlot + barPlot + barFill + yLabel + xLabel + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.ladder != "." & input$x.ladder != input$y.ladder & input$x.ladder != "wealth")
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 700)


################################################################################
#
# Plot overall indicators
#
################################################################################
  #
  # 
  #
  output$overall <- renderPlot({
    #
    #
    #
    if(input$x.overall == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.overall(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))
    #
    #
    #
    if(input$x.overall == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.overall(),
                         mapping = aes_string(x = input$x.overall,
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    if(input$x.overall == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.overall(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", position = "fill", alpha = 0.8)
    #
    #
    #
    barFill <- scale_fill_manual(name = "Services Access",
                                 labels = c("Adequate water and sanitation",
                                            "Adequate water only",
                                            "Adequate sanitation only",
                                            "No access to adequate services"),
                                 values = rev(overallColour))
    #
    # Facets - type and surveyArea
    #
    if(input$x.overall == "type" & input$y.overall == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if((input$x.overall == "surveyArea" | input$x.overall == "wealth") & input$y.overall == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.overall))
    #
    # x-axis labels
    #
    xLabel <- labs(y = "Proportion")
    #
    # y-axis label for surveyArea
    #
    if(input$x.overall == "surveyArea") yLabel <- labs(x = "Survey Area")
    #
    # y-axis label for type
    #
    if(input$x.overall == "type") yLabel <- labs(x = "Area Type")    
    #
    # y-axis label for wealthQuintile
    #
    if(input$x.overall == "wealth") yLabel <- labs(x = "Wealth Quintile")    
    #
    # Create plot
    #
    p <- basePlot + barPlot + barFill + yLabel + xLabel + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.overall != "." & input$x.overall != input$y.overall & input$x.overall != "wealth")
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 700)


################################################################################
#
# Plot water indicators
#
################################################################################
  #
  # 
  #
  output$water <- renderPlot({
    #
    #
    #
    if(input$x.water == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.water(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.water == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.water(),
                         mapping = aes_string(x = input$x.water,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.water == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.water(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.water == "type" & input$y.water == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.water == "surveyArea" & input$y.water == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.water))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.water == "wealth" & input$y.water == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.water))
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$z.water == "water12" & input$country4 == "Bangladesh", "Bangladesh Taka (BDT)", "Proportion"))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.water == "surveyArea", "Survey Area",
                         ifelse(input$x.water == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + theme_wsup
    #
    #
    #
    if(input$z.water != "water12")
      #
      #
      #
      p <- p + ylim(c(0, 1))
    #
    # Set conditions for displaying facets
    #
    if(input$y.water != "." & input$x.water != input$y.water)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 700)
  
  
################################################################################
#
# Plot sanitation indicators
#
################################################################################
  #
  # 
  #
  output$sanitation <- renderPlot({
    #
    #
    #
    if(input$x.sanitation == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.sanitation(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.sanitation == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.sanitation(),
                         mapping = aes_string(x = input$x.sanitation,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.sanitation == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.sanitation(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.sanitation == "type" & input$y.sanitation == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.sanitation == "surveyArea" & input$y.sanitation == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.sanitation))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.sanitation == "wealth" & input$y.sanitation == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.sanitation))
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$z.sanitation == "san14" & input$country5 == "Bangladesh", "Bangladesh Taka (BDT)", 
                         ifelse(input$z.sanitation == "san13", "Time (minutes)", "Proportion")))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.sanitation == "surveyArea", "Survey Area",
                         ifelse(input$x.sanitation == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + theme_wsup
    #
    #
    #
    if(!input$z.sanitation %in% c("san13", "san14"))
      #
      #
      #
      p <- p + ylim(c(0, 1))
    #
    # Set conditions for displaying facets
    #
    if(input$y.sanitation != "." & input$x.sanitation != input$y.sanitation)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 700)


################################################################################
#
# Plot hygiene indicators
#
################################################################################
  #
  # 
  #
  output$hygiene <- renderPlot({
    #
    #
    #
    if(input$x.hygiene == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.hygiene(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.hygiene == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.hygiene(),
                         mapping = aes_string(x = input$x.hygiene,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.hygiene == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.hygiene(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.hygiene == "type" & input$y.hygiene == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.hygiene == "surveyArea" & input$y.hygiene == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.hygiene))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.hygiene == "wealth" & input$y.hygiene == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.hygiene))
    #
    # y-axis labels
    #
    yLabel <- labs(y = "Proportion")
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.hygiene == "surveyArea", "Survey Area",
                         ifelse(input$x.hygiene == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + ylim(c(0, 1)) + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.hygiene != "." & input$x.hygiene != input$y.hygiene)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 700)


################################################################################
#
# Create leaflet maps
#
################################################################################



}



