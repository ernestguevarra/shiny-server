################################################################################
#
# Server logic for web application
#
################################################################################
#
# Define server logic for application
#
server <- function(input, output, session) {
  ## Update data input for startDate
  observe({
      updateDateInput(session = session,
        inputId = "startDate",
        label = "Start date",
        value = input$surveyStart,
        min = input$surveyStart,
        max = Sys.Date())
  })
  ## Get data from ONA server
  surveyData <- eventReactive(input$getData, {
    get_mcct_data(id = "baseline_mcct",
                  username = input$username,
                  start = input$startDate,
                  end = input$endDate,
                  filename = "surveyData") %>%
      prepare_hh_data()
  })
  ## Create survey data table
  output$surveyDataTable <- DT::renderDataTable(expr = surveyData(),
                                                options = list(scrollX = TRUE))
  ## Update variable 2 choices
  var2choices <- reactive({
    x <- c("Interview Date" = "intrv_date",
           "State" = "geo_state",
           "Township" = "geo_town",
           "Village tract" = "geo_vt",
           "Village/Ward" = "geo_villward",
           "Survey team" = "svy_team",
           "Enumerator" = "enu_name")
    x <- x[stringr::str_detect(x, pattern = input$var1, negate = TRUE)]
  })
  ## Update variable 2 choices
  observe({
    updateSelectInput(session = session,
      inputId = "var2",
      label = "Check variable 2",
      choices = c("Choose..." = ".", var2choices())
    )
  })
  ## Update variable 3 choices
  var3choices <- reactive({
    x <- c("Interview Date" = "intrv_date",
           "State" = "geo_state",
           "Township" = "geo_town",
           "Village tract" = "geo_vt",
           "Village/Ward" = "geo_villward",
           "Survey team" = "svy_team",
           "Enumerator" = "enu_name")
    x <- x[stringr::str_detect(x, pattern = input$var1, negate = TRUE)]
    x <- x[stringr::str_detect(x, pattern = input$var2, negate = TRUE)]
  })
  ## Update variable 3 choices
  observe({
    updateSelectInput(session = session,
                      inputId = "var3",
                      label = "Check variable 3",
                      choices = c("Choose..." = ".", var3choices())
    )
  })
  ## Plot progress tracker
  output$trackingPlot <- renderPlot({
    p <- ggplot(data = surveyData(), aes_string(x = input$var1)) +
      stat_count(colour = "#247BA0", fill = "#70C1B3") +
      coord_flip()
    ## Create facets
    facets <- paste(input$var2, "~", input$var3, sep = " ")
    ## Add facets
    if(facets != ". ~ .") {
      p <- p + facet_grid(facets = facets)
    }
    ## Add plotting theme
    p + themeSettings
  })
  ## Create duplicates table
  output$duplicateTable <- DT::renderDataTable(
    expr = check_hh_duplicate(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Create consent table
  output$consentTable <- DT::renderDataTable(
    expr = check_hh_consent(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Create outside table
  output$outsideTable <- DT::renderDataTable(
    expr = check_hh_date(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Update variable check choices
  observe({
    updateSelectInput(session = session,
      inputId = "vars",
      label = "Select variables",
      choices = names(surveyData())
    )
  })
  ## Plot enumerator performance
  output$performancePlot <- renderPlot({
    x <- check_hh_response(df = surveyData(), vars = input$vars)
    ##
    p <- ggplot(data = x, aes(x = Enumerator, y = Frequency)) +
      geom_col(colour = "#247BA0", fill = "#70C1B3") +
      coord_flip()
    ## Create facets
    facets <- paste(". ~ Response", sep = "")
    ##
    if(facets != ". ~ .") {
      p <- p + facet_grid(facets = facets)
    }
    ##
    p + themeSettings
  })
}
