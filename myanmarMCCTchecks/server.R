################################################################################
#
# Server logic for web application
#
################################################################################
#
# Define server logic for application
#
server <- function(input, output, session) {
  ## Keep alive
  output$keepAlive <- renderText({
    req(input$count)
    paste("keep alive ", input$count)
  })
  ## Update data input for startDate
  observe({
      updateDateInput(session = session,
        inputId = "startDate",
        label = "Start date",
        value = input$surveyStart,
        min = input$surveyStart,
        max = Sys.Date())
  })
  ## Create UI action button for getting data
  output$getDataButton <- renderUI({
    req(input$password)
    actionButton(inputId = "getData",
      label = "Get data",
      class = "btn btn-inverse btn-primary",
      icon = icon(name = "database",
                  lib = "font-awesome",
                  class = "fa-lg")
    )
  })
  ## Create UI action button for viewing data
  output$viewDataButton <- renderUI({
    req(input$getData)
    actionButton(inputId = "viewData",
      label = "View data",
      class = "btn btn-inverse btn-primary",
      icon = icon(name = "eye",
                  lib = "font-awesome",
                  class = "fa-lg")
    )
  })
  ## Create UI action button for saving data
  output$saveDataButton <- renderUI({
    req(input$getData)
    downloadButton(outputId = "saveData",
      label = "Save data",
      class = "btn btn-inverse btn-primary",
      icon = icon(name = "download",
                  lib = "font-awesome",
                  class = "fa-lg")
    )
  })
  ## Create box UI for viewing data
  output$viewDataBox <- renderUI({
    req(input$viewData)
    box(title = "Dataset for checking",
        solidHeader = TRUE,
        status = "primary",
        width = 12,
        DT::dataTableOutput("surveyDataTable")
    )
  })
  ## Get data from ONA server
  surveyData <- eventReactive(input$getData, {

    progress <- Progress$new()
    on.exit(progress$close())
    progress$set(message = "Pulling data from ODK server", value = 0.5)

    isolate(
      get_mcct_data(id = "baseline_mcct_final",
                    username = input$username,
                    password = input$password,
                    start = input$startDate,
                    end = input$endDate,
                    filename = "surveyData") %>%
        prepare_hh_data()
    )
  })
  ## Download data
  output$saveData <- downloadHandler(
    filename = function(format = input$dataFormat) {
      if(format == "xls")
        paste(input$fileName, "-", Sys.Date(), ".xlsx", sep = "")
      else
        paste(input$fileName, "-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file, format = input$dataFormat) {
      if(format == "xls")
        openxlsx::write.xlsx(x = surveyData(), file = file)
      else
        write.csv(x = surveyData(), file = file, row.names = FALSE)
    }
  )
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
  ## Create UI for track progress plots
  output$trackingPlotBox <- renderUI({
    req(input$getData, input$plotHeight)
    tabBox(title = "Survey Progress",
      id = "progressTabs",
      width = 12,
      tabPanel(title = "Plot",
        value = "tabPlot",
        plotOutput(outputId = "trackingPlot",
                   height = input$plotHeight)
      ),
      tabPanel(title = "Summary",
        value = "tabSummary",
        fluidRow(
          valueBoxOutput(outputId = "totalObsBox",
            width = 3
          ),
          valueBoxOutput(outputId = "obsPerTeam",
            width = 3
          ),
          valueBoxOutput(outputId = "obsPerEnumerator",
            width = 3
          ),
          valueBoxOutput(outputId = "obsPerDay",
            width = 3
          )
        ),
        fluidRow(
          valueBoxOutput(outputId = "obsPerDayPerTeam",
            width = 3
          ),
          valueBoxOutput(outputId = "obsPerDayPerEnumerator",
                         width = 3
          ),
          valueBoxOutput(outputId = "villagePerDay",
                         width = 3
          ),
          valueBoxOutput(outputId = "obsPerDayPerVillage",
                         width = 3
          )
        )
      )
    )
  })
  ## Plot progress tracker
  output$trackingPlot <- renderPlot({
    req(input$plotDirection, input$plotCols)
    p <- ggplot(data = surveyData(), aes_string(x = input$var1)) +
      stat_count(colour = "#247BA0", fill = "#70C1B3")
    ## Create facets
    facets <- paste(input$var2, "~", input$var3, sep = " ")
    ## Add facets
    if(facets != ". ~ .") {
      p <- p + facet_wrap(facets = facets, ncol = input$plotCols)
    }
    ## Vertical or horzontal bars?
    if(input$plotDirection == "h") {
      p <- p + coord_flip()
    }
    ## Add plotting theme
    p + themeSettings
  })
  ## Create UI for plot settings
  output$plotSettings <- renderUI({
    req(input$getData)
    box(title = "Plot settings",
      solidHeader = TRUE,
      status = "primary",
      width = 4,
      radioButtons(inputId = "plotDirection",
        label = "Direction",
        choices = c("horizontal" = "h", "vertical" = "v"),
        selected = "h",
        inline = TRUE
      ),
      sliderInput(inputId = "plotCols",
        label = "Plot panel columns",
        value = 3,
        min = 1,
        max = 4,
        step = 1
      ),
      sliderInput(inputId = "plotHeight",
        label = "Plot height",
        value = 600,
        min = 400,
        max = 800,
        step = 10
      )
    )
  })
  ## Create UI for total observations value box
  output$totalObsBox <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[1, 2],
      subtitle = "Total forms submitted",
      icon = icon(name = "file",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "blue")
  })
  ## Create UI for observations per survey team
  output$obsPerTeam <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[2, 2],
      subtitle = "Forms per survey team",
      icon = icon(name = "users",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "aqua")
  })
  ## Create UI for observations per enumerator
  output$obsPerEnumerator <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[3, 2],
      subtitle = "Forms per enumerator",
      icon = icon(name = "user-circle",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "teal"
    )
  })
  ## Create UI for observations per day
  output$obsPerDay <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[4, 2],
      subtitle = "Forms per day",
      icon = icon(name = "calendar",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "light-blue"
    )
  })
  ## Create UI for number of forms per day per team
  output$obsPerDayPerTeam <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[5, 2],
      subtitle = "Forms per day per team",
      icon = icon(name = "users",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "orange"
    )
  })
  ## Create UI for number of forms per day per enumerator
  output$obsPerDayPerEnumerator <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[6, 2],
      subtitle = "Forms per day per enumerator",
      icon = icon(name = "user-circle",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "olive"
    )
  })
  ## Create UI for number of villages/wards per day
  output$villagePerDay <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[7, 2],
      subtitle = "Villages/wards per day",
      icon = icon(name = "home",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "purple"
    )
  })
  ## Create UI for number of forms per day per village/ward
  output$obsPerDayPerVillage <- renderValueBox({
    valueBox(value = summarise_progress(df = surveyData(),
                                        area = "geo_villward",
                                        start = input$surveyStart)[8, 2],
      subtitle = "Forms per day per village/ward",
      icon = icon(name = "home",
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = "fuchsia"
    )
  })
  ## Create duplicates table
  output$duplicateTable <- DT::renderDataTable(
    expr = check_hh_duplicate(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Create total number of duplicates
  output$totalDuplicates <- renderValueBox({
    valueBox(value = sum(check_hh_duplicate(df = surveyData(),
                                            extract =  FALSE)),
      subtitle = "Duplicate forms",
      icon = icon(name = ifelse(sum(check_hh_duplicate(df = surveyData(),
                                                       extract =  FALSE)) > 0,
                                "thumbs-down", "thumbs-up"),
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = ifelse(sum(check_hh_duplicate(df = surveyData(),
                                            extract =  FALSE)) > 0,
                     "red", "green")
    )
  })
  ## Create total no consent value box
  output$totalNoConsent <- renderValueBox({
    valueBox(value = nrow(check_hh_consent(df = surveyData())),
      subtitle = "No consent forms",
      icon = icon(name = ifelse(nrow(check_hh_consent(df = surveyData())) > 0,
                                "thumbs-down", "thumbs-up"),
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = ifelse(nrow(check_hh_consent(df = surveyData())) > 0,
                     "red", "green")
    )
  })
  ## Create consent table
  output$consentTable <- DT::renderDataTable(
    expr = check_hh_consent(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Create total no consent value box
  output$totalNoConsent <- renderValueBox({
    valueBox(value = nrow(check_hh_consent(df = surveyData())),
      subtitle = "No consent forms",
      icon = icon(name = ifelse(nrow(check_hh_consent(df = surveyData())) > 0,
                                     "thumbs-down", "thumbs-up"),
                  lib = "font-awesome",
                  class = "fa-sm"),
      color = ifelse(nrow(check_hh_consent(df = surveyData())) > 0,
                     "red", "green")
    )
  })
  ## Create outside table
  output$outsideTable <- DT::renderDataTable(
    expr = check_hh_date(df = surveyData()),
    options = list(scrollX = TRUE)
  )
  ## Create total outside survey date value box
  output$totalOutsideSurvey <- renderValueBox({
    valueBox(value = nrow(check_hh_date(df = surveyData())),
             subtitle = "Outside survey date",
             icon = icon(name = ifelse(nrow(check_hh_date(df = surveyData())) > 0,
                                       "thumbs-down", "thumbs-up"),
                         lib = "font-awesome",
                         class = "fa-sm"),
             color = ifelse(nrow(check_hh_date(df = surveyData())) > 0,
                            "red", "green")
    )
  })
  ## Update variable check choices
  observe({
    updateSelectInput(session = session,
      inputId = "vars",
      label = "Select variables",
      choices = names(surveyData())
    )
  })
  ## Create UI for plot settings
  output$plotSettingsBox <- renderUI({
    req(input$getData)
    box(title = "Plot settings",
      solidHeader = TRUE,
      status = "primary",
      width = 4,
      radioButtons(inputId = "performPlotDirection",
        label = "Direction",
        choices = c("horizontal" = "h", "vertical" = "v"),
        selected = "h",
        inline = TRUE
      ),
      sliderInput(inputId = "performPlotCols",
        label = "Plot panel columns",
        value = 3,
        min = 1,
        max = 4,
        step = 1
      ),
      sliderInput(inputId = "performPlotHeight",
        label = "Plot height",
        value = 600,
        min = 400,
        max = 800,
        step = 10
      )
    )
  })
  ## Create UI for performance plot
  output$performancePlotBox <- renderUI({
    req(input$getData, input$performPlotHeight)
    box(title = "Enumerator performance",
      solidHeader = TRUE,
      status = "primary",
      width = 12,
      plotOutput(outputId = "performancePlot",
                 height = input$performPlotHeight)
    )
  })
  ## Plot enumerator performance
  output$performancePlot <- renderPlot({
    req(input$performPlotDirection, input$performPlotCols)
    x <- check_hh_response(df = surveyData(), vars = input$vars)
    ##
    p <- ggplot(data = x, aes(x = Enumerator, y = Frequency)) +
      geom_col(colour = "#247BA0", fill = "#70C1B3")
    ## Check plot direction
    if(input$performPlotDirection == "h") {
      p <- p + coord_flip()
    }
    ## Create facets
    facets <- paste(". ~ Response", sep = "")
    ##
    if(facets != ". ~ .") {
      p <- p + facet_wrap(facets = facets, ncol = input$performPlotCols)
    }
    ## theme
    if(input$performPlotDirection == "v") {
      v <- themeSettings +
        theme(axis.text.x = element_text(angle = 30, hjust = 1,
                                         vjust = 1))
    } else {
      v <- themeSettings
    }
    ##
    p + v
  })
}
