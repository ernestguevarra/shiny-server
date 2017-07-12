
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

################################################################################
#
# Dynamic UI
#
################################################################################
  #
  # Update choices
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
                          choices = c("Survey Area" = "surveyArea"))
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
  #
  #
  #
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
  #
  #
  #
  observe({
      #
      #
      #
      if(input$z.poverty == "ppp125")
        #
        #
        #
        updateSliderInput(session = session,
                          inputId = "bins.poverty",
                          label = "Number of bins:",
                          value = 0.1, step = 0.1,
                          min = 0.1, max = 1)
      #
      #
      #
      if(input$z.poverty != "ppp125")
        #
        #
        #
        updateSliderInput(session = session,
                          inputId = "bins.poverty",
                          label = "Number of bins:",
                          value = 1, step = 1,
                          min = 1, max = 5)
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$z.ladder == "waterSet1")
        #
        #
        #
        updateSelectInput(session = session,
                          inputId = "indicator.ladder",
                          label = "Select indicator",
                          choices = list("Surface water" = "jmpWater5",
                                         "Unimproved" = "jmpWater4",
                                         "Limited" = "jmpWater3",
                                         "Basic" = "jmpWater2",
                                         "Safely-managed" = "jmpWater1"),
                          selected = "jmpWater5")
    #
    #
    #
    if(input$z.ladder == "sanSet1")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "indicator.ladder",
                        label = "Select indicator", 
                        choices = list("Open defecation" = "jmpSan5",
                                       "Unimproved" = "jmpSan4",
                                       "Limited" = "jmpSan3",
                                       "Basic" = "jmpSan2",
                                       "Safely-managed" = "jmpSan1"),
                        selected = "jmpSan5")
    #
    #
    #
    if(input$z.ladder == "handSet")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "indicator.ladder",
                        label = "Select indicator",
                        choices = list("No facility" = "jmpHand3",
                                       "Limited" = "jmpHand2",
                                       "Basic" = "jmpHand1"),
                        selected = "jmpHand3")
  })
  #
  #
  #
  output$map.bins.demographics.control <- renderUI({
    #
    # UI if map.colour.demographics == "interval"
    #
    if(input$map.colour.demographics == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.demographics",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.demographics.control <- renderUI({
    #
    # UI if map.colour.demographics == "quantile" 
    #
    if(input$map.colour.demographics == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.demographics",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.poverty.control <- renderUI({
    #
    # UI if map.colour.poverty == "interval"
    #
    if(input$map.colour.poverty == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.poverty",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.poverty.control <- renderUI({
    #
    # UI if map.colour.poverty == "quantile" 
    #
    if(input$map.colour.poverty == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.poverty",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.ladder.control <- renderUI({
    #
    # UI if map.colour.ladder == "interval"
    #
    if(input$map.colour.ladder == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.ladder",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.ladder.control <- renderUI({
    #
    # UI if map.colour.ladder == "quantile" 
    #
    if(input$map.colour.ladder == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.ladder",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.water.control <- renderUI({
    #
    # UI if map.colour.water == "interval"
    #
    if(input$map.colour.water == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.water",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.water.control <- renderUI({
    #
    # UI if map.colour.water == "quantile" 
    #
    if(input$map.colour.water == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.water",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.sanitation.control <- renderUI({
    #
    # UI if map.colour.sanitation == "interval"
    #
    if(input$map.colour.sanitation == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.sanitation",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.sanitation.control <- renderUI({
    #
    # UI if map.colour.sanitation == "quantile" 
    #
    if(input$map.colour.sanitation == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.sanitation",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.hygiene.control <- renderUI({
    #
    # UI if map.colour.hygiene == "interval"
    #
    if(input$map.colour.hygiene == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.hygiene",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.hygiene.control <- renderUI({
    #
    # UI if map.colour.hygiene == "quantile" 
    #
    if(input$map.colour.hygiene == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.hygiene",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.overall.control <- renderUI({
    #
    # UI if map.colour.overall == "interval"
    #
    if(input$map.colour.overall == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.overall",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.overall.control <- renderUI({
    #
    # UI if map.colour.overall == "quantile" 
    #
    if(input$map.colour.overall == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.overall",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.demographics",
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
                        inputId = "map.colour.demographics",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.poverty",
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
                        inputId = "map.colour.poverty",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.water",
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
                        inputId = "map.colour.water",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$indicator.ladder]], city.results.sp[[input$indicator.ladder]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.ladder",
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
                        inputId = "map.colour.ladder",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.sanitation",
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
                        inputId = "map.colour.sanitation",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.hygiene]], city.results.sp[[input$z.hygiene]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.hygiene",
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
                        inputId = "map.colour.hygiene",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$indicator.overall]], city.results.sp[[input$indicator.overall]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.overall",
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
                        inputId = "map.colour.overall",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
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
    histPlot <- geom_histogram(binwidth = input$bins.demographics, color = wsupColour, fill = wsupColour, alpha = 0.6)
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
  }, height = 500)



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
    #binwidth <- ifelse(input$z.poverty != "ppp125", input$bins.ppi, input$bins.ppp125)
    #if(input$z.poverty != "ppp125") binwidth <- input$bins.ppi
    #if(input$z.poverty == "ppp125") binwidth <- input$bins.ppp125     
    #
    # Layers
    #
    povertyPlot <- geom_histogram(binwidth = input$bins.poverty, 
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
  }, height = 500)


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
  }, height = 500)


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
  }, height = 500)


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
  }, height = 500)
  
  
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
  }, height = 500)


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
  }, height = 500)


################################################################################
#
#
# Create leaflet maps
#
#
################################################################################
 
################################################################################
#
# Demographics Map
#
################################################################################ 

  output$map.demographics <- renderLeaflet({
    #
    # 
    #
    if(input$map.colour.demographics == "linear")
      {
      #
      #
      #
      values <- c(1, max(c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])))      
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.demographics,
                          domain = values)
      }
    #
    #
    #
    if(input$map.colour.demographics == "interval")
      {
      #
      #
      #
      values <- c(1, max(c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])))
      #
      #
      #
      pal <- colorBin(palette = input$palette.demographics, 
                      domain = values,
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.demographics), 5, input$map.bins.demographics))
      }
    #
    #
    #
    if(input$map.colour.demographics == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.demographics,
                           domain = c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]]),
                           n = ifelse(is.null(input$map.n.demographics), 5, input$map.n.demographics))
      #
      #
      #
      values <- c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.demographics]], " household members", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.demographics]], " household members", sep = "")
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$z.demographics]]),
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
      # Citywid polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$z.demographics]]),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      #
      #
      addLegend(pal = pal, values = values, opacity = 0.7,
	    position = "bottomleft", 
	    labFormat = labelFormat(between = " to "),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.demographics],
	    layerId = "legend") %>%
      #
      #
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        options = layersControlOptions(collapsed = FALSE, autoZIndex = TRUE)) %>%
      #
      #
      #
      hideGroup(c("Upazila", "Wards")) %>%
      #
      #
      #
      htmlwidgets::onRender("
        function(el, x) {
          this.on('baselayerchange', function(e) {
            e.layer.bringToBack();
          })
        }
      ")
  })

  
################################################################################
#
# Poverty maps
#
################################################################################  
  #
  # Poverty
  #
  output$map.poverty <- renderLeaflet({
    #
    #
    #
    if(input$z.poverty == "ppi") domain <- c(0, 100)
    if(input$z.poverty == "ppp125") domain <- c(0, 1)
    if(input$z.poverty == "pQuintile") domain <- c(1, 5)
    
    #
    # Linear interpolation
    #
    if(input$map.colour.poverty == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.poverty,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.poverty == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.poverty,
                      domain = domain, 
                      pretty = FALSE,
                      bins = ifelse(is.null(input$map.bins.poverty), 5, input$map.bins.poverty))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.poverty == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.poverty,
                           domain = c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]]),
                           n = ifelse(is.null(input$map.n.poverty), 5, input$map.n.poverty))
      #
      #
      #
      values <- c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]])
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.poverty]], sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.poverty]], sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$z.poverty]]), 
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
      # City polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$z.poverty]]),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      # Add legend
      #
      addLegend(
        pal = pal, 
        values = values,
        opacity = 0.7,
	    position = "bottomleft", 
	    labFormat = labelFormat(between = " to ", suffix = ""),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.poverty],
	    layerId = "legend") %>%
      #
      # Add layer control
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        options = layersControlOptions(collapsed = FALSE)) %>%
      #
      # Hide overlays
      #
      hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Ladder maps
#
################################################################################  
  #
  # Ladder
  #
  output$map.ladder <- renderLeaflet({
    #
    # Domains
    #
    domain <- c(0, 100)
    #
    # Linear interpolation
    #
    if(input$map.colour.ladder == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.ladder,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.ladder == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.ladder,
                      domain = domain, 
                      pretty = FALSE,
                      bins = ifelse(is.null(input$map.bins.ladder), 5, input$map.bins.ladder))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.ladder == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.ladder,
                           domain = c(slum.results.sp[[input$indicator.ladder]] * 100, city.results.sp[[input$indicator.ladder]] * 100),
                           n = ifelse(is.null(input$map.n.ladder), 5, input$map.n.ladder))
      #
      #
      #
      values <- c(slum.results.sp[[input$indicator.ladder]] * 100, city.results.sp[[input$indicator.ladder]] * 100)
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$indicator.ladder]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$indicator.ladder]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$indicator.ladder]] * 100), 
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
      # City polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$indicator.ladder]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      # Add legend
      #
      addLegend(
        pal = pal, 
        values = values,
        opacity = 0.7,
	    position = "bottomleft", 
	    labFormat = ifelse(input$map.colour.ladder == "quantile", labelFormat(between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$indicator.ladder],
	    layerId = "legend") %>%
      #
      # Add layer control
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        options = layersControlOptions(collapsed = FALSE)) %>%
      #
      # Hide overlays
      #
      hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Water
#
################################################################################
  #
  # Water
  #
  output$map.water <- renderLeaflet({
    #
    #
    #
    if(input$z.water != "water12")
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.water == "linear")
        {
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.water,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)        
        }
      #
      # Equal interval
      #
      if(input$map.colour.water == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorBin(palette = input$palette.water,
                        domain = domain, 
                        pretty = FALSE,
                        bins = ifelse(is.null(input$map.bins.water), 5, input$map.bins.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)        
        }
      #
      # Quantile
      #
      if(input$map.colour.water == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.water]] * 100, city.results.sp[[input$z.water]] * 100)
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.water,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.water), 5, input$map.n.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.water]] * 100, "%", sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.water]] * 100, "%", sep = "")
      }
    #
    #
    #  
    if(input$z.water == "water12")
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.water == "linear")
        {
        domain <- c(0, max(c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])))
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.water,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])                
        }
      #
      # Equal interval
      #
      if(input$map.colour.water == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])))
        #
        #
        #
        pal <- colorBin(palette = input$palette.water,
                        domain = domain, 
                        pretty = FALSE,
                        bins = ifelse(is.null(input$map.bins.water), 5, input$map.bins.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])        
        }
      #
      # Quantile
      #
      if(input$map.colour.water == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.water,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.water), 5, input$map.n.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])        
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.water]], sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.water]], sep = "")
      }
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    #
    leaflet(outline) %>%
    #
    #
    #
    setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
    #  
    #
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = slum.fill,
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = city.fill,
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomleft",
	  labFormat = ifelse(input$map.colour.water == "quantile" | input$z.water == "water12", labelFormat(between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.water],
	    layerId = "Slum") %>%
    #
    #
    #
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Sanitation
#
################################################################################
  #
  # Sanitation
  #
  output$map.sanitation <- renderLeaflet({
    #
    #
    #
    if(!input$z.sanitation %in% c("san13", "san14"))
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.sanitation == "linear")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.sanitation,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        }
      #
      # Equal interval
      #
      if(input$map.colour.sanitation == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorBin(palette = input$palette.sanitation,
                        domain = domain, 
                        pretty = FALSE,
                        bins = ifelse(is.null(input$map.bins.sanitation), 5, input$map.bins.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(city.results.sp[[input$z.sanitation]] * 100)
        }
      #
      # Quantile
      #
      if(input$map.colour.sanitation == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.sanitation]] * 100, city.results.sp[[input$z.sanitation]] * 100)
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.sanitation,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.sanitation), 5, input$map.n.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.sanitation]] * 100, "%", sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.sanitation]] * 100, "%", sep = "")
      }
    #
    #
    #
    if(input$z.sanitation %in% c("san13", "san14"))
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.sanitation == "linear")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])))
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.sanitation,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(slum.results.sp[[input$z.sanitation]])
        }
      #
      # Equal interval
      #
      if(input$map.colour.sanitation == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])))
        #
        #
        #
        pal <- colorBin(palette = input$palette.sanitation,
                        domain = domain, 
                        pretty = FALSE,
                        bins = ifelse(is.null(input$map.bins.sanitation), 5, input$map.bins.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(city.results.sp[[input$z.sanitation]])
        }
      #
      # Quantile
      #
      if(input$map.colour.sanitation == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.sanitation,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.sanitation), 5, input$map.n.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(slum.results.sp[[input$z.sanitation]])
        }    
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.sanitation]], sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.sanitation]], sep = "")
      }
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    #
    leaflet(outline) %>%
    #
    #
    #
    setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
    #  
    #
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = slum.fill,
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = city.fill,
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomleft",
	  labFormat = ifelse(input$map.colour.sanitation == "quantile" | input$z.sanitation %in% c("san13", "san14"), labelFormat(between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.sanitation],
	    layerId = "Slum") %>%
    #
    #
    #
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Hygiene
#
################################################################################
  #
  # hygiene
  #
  output$map.hygiene <- renderLeaflet({
    #
    # Linear interpolation
    #
    if(input$map.colour.hygiene == "linear")
      {
      #
      # Domains
      #
      domain <- c(0, 100)
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.hygiene,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.hygiene == "interval")
      {
      #
      # Domains
      #
      domain <- c(0, 100)
      #
      #
      #
      pal <- colorBin(palette = input$palette.hygiene,
                      domain = domain, 
                      pretty = FALSE,
                      bins = ifelse(is.null(input$map.bins.hygiene), 5, input$map.bins.hygiene))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.hygiene == "quantile")
      {
      #
      # Domains
      #
      domain <- c(slum.results.sp[[input$z.hygiene]] * 100, city.results.sp[[input$z.hygiene]] * 100)
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.hygiene,
                            domain = domain,
                            n = ifelse(is.null(input$map.n.hygiene), 5, input$map.n.hygiene))
      #
      #
      #
      values <- domain
      }
    #
    #
    #
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.hygiene]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.hygiene]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    #
    leaflet(outline) %>%
    #
    #
    #    
    setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
    #
    #
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = pal(slum.results.sp[[input$z.hygiene]] * 100),
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = pal(city.results.sp[[input$z.hygiene]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomleft",
	  labFormat = ifelse(input$map.colour.hygiene == "quantile", labelFormat(between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")),
	  title = steerIndicators$varShort[steerIndicators$varList == input$z.hygiene],
	  layerId = "Slum") %>%
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Overall maps
#
################################################################################  
  #
  # Overall
  #
  output$map.overall <- renderLeaflet({
    #
    # Domains
    #
    domain <- c(0, 100)
    #
    # Linear interpolation
    #
    if(input$map.colour.overall == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.overall,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.overall == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.overall,
                      domain = domain, 
                      pretty = FALSE,
                      bins = ifelse(is.null(input$map.bins.overall), 5, input$map.bins.overall))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.overall == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.overall,
                           domain = c(slum.results.sp[[input$indicator.overall]] * 100, city.results.sp[[input$indicator.overall]] * 100),
                           n = ifelse(is.null(input$map.n.overall), 5, input$map.n.overall))
      #
      #
      #
      values <- c(slum.results.sp[[input$indicator.overall]] * 100, city.results.sp[[input$indicator.overall]] * 100)
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$indicator.overall]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$indicator.overall]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      setView(lng = mean(coordinates(outline)[,1]), lat = mean(coordinates(outline)[,2]) + 0.02, zoom = 11) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite") %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$indicator.overall]] * 100), 
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
      # City polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$indicator.overall]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      # Add legend
      #
      addLegend(
        pal = pal, 
        values = values,
        opacity = 0.7,
	    position = "bottomleft", 
	    labFormat = labelFormat(between = " to ", suffix = "%"),
	    title = steerIndicators$varShort[steerIndicators$varList == input$indicator.overall],
	    layerId = "legend") %>%
      #
      # Add layer control
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        options = layersControlOptions(collapsed = FALSE)) %>%
      #
      # Hide overlays
      #
      hideGroup(c("Upazila", "Wards")) %>%
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

################################################################################
#
#
# Data Tables
#
#
################################################################################
  
################################################################################
  #
  # Create data table output for demographics indicator set
  #
  output$table.demographics <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(indicatorsDF, select = c(country, ccode, zone, type, nMembers))
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country1)
    #
    # Filter data by survey area
    #
    if(input$table.demographics.area != "All")
      {
      #
      #
      #
      df <- df[df$zone == input$table.demographics.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.demographics.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.demographics.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for poverty indicator set
  #
  output$table.poverty <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    # Subset to poverty indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "poverty"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country2)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.poverty)
    #
    # Filter data by survey area
    #
    if(input$table.poverty.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.poverty.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.poverty.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.poverty.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for service ladder indicator set
  #
  output$table.ladder <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to ladder indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$z.ladder], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country3)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$indicator.ladder)
    #
    # Filter data by survey area
    #
    if(input$table.ladder.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.ladder.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.ladder.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.ladder.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other water indicator set
  #
  output$table.water <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[df$indicatorCode != "water12" , c("estimate", "lcl", "ucl")] <- df[df$indicatorCode != "water12" , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to water indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet != "waterSet1"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country4)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.water)
    #
    # Filter data by survey area
    #
    if(input$table.water.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.water.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.water.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.water.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other sanitation indicator set
  #
  output$table.sanitation <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[!df$indicatorCode %in% c("san13", "san14") , c("estimate", "lcl", "ucl")] <- df[!df$indicatorCode %in% c("san13", "san14"), c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to sanitation indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet != "sanSet1"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country5)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.sanitation)
    #
    # Filter data by survey area
    #
    if(input$table.sanitation.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.sanitation.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.sanitation.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.sanitation.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other hygiene indicator set
  #
  output$table.hygiene <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to hygiene indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "hygieneSet"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country6)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.hygiene)
    #
    # Filter data by survey area
    #
    if(input$table.hygiene.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.hygiene.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.hygiene.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.hygiene.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other overall indicator set
  #
  output$table.overall <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to overall indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$z.overall], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country7)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$indicator.overall)
    #
    # Filter data by survey area
    #
    if(input$table.overall.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.overall.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.overall.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.overall.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))


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
    inputFile <- input$file1
    #
    #
    #
    if (is.null(inputFile)) {return(NULL)}
    #
    #
    #
    sample.df <- read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
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
  observeEvent(input$calculate, {
	  #
	  # Calculate deff
	  #
	  deff <- deff(y = sample.df()[[input$variable]], cluster = sample.df()[[input$cluster]])[["deff"]]
	  #
	  #
	  #
	  z.ci <- ifelse(input$z.ci == "1.96", 1.96,
				ifelse(input$z.ci == "1.75", 1.75,
				  ifelse(input$z.ci == "1.645", 1.645, 2.05)))
	  #
	  # Calculate sample size
	  #
	  sample.size <- (z.ci ^ 2) * (((input$proportion / 100) * (1 - (input$proportion / 100))) / ((input$precision / 100) ^ 2))
	  #    
	  # Compose data frame
	  #
	  sample.parameters <- data.frame(Parameters = c("Confidence Interval", 
													 "Expected proportion/prevalence",
													 "Precision",
													 "Design effect",
													 "Sample size"),
									  Value = as.character(c(input$z.ci, 
															 input$proportion,
															 input$precision,
															 deff,
															 sample.size)), 
									  stringsAsFactors=FALSE)

	  output$sample <- renderTable({
		sample.parameters
	  })
  })
}



