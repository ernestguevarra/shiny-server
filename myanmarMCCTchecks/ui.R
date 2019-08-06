################################################################################
#
# UI for web application
#
################################################################################
#
# Define UI for application
#
ui <- dashboardPage(
  skin = "red",
  ## Header
  dashboardHeader(
    title = "Myanmar MCCT Data Checks",
    titleWidth = 350),
  ## Sidebar
  dashboardSidebar(
    width = 350,
    sidebarSearchForm(
      textId = "searchText",
      buttonId = "searchButton"
    ),
    ## Sidebar menu
    sidebarMenu(
      id = "tabs",
      menuItem(text = "Data check parameters",
               tabName = "settings",
               icon = icon(name = "pencil",
                           lib = "font-awesome",
                           class = "fa-lg")),
      menuItem(text = "Track progress",
               tabName = "track",
               icon = icon(name = "line-chart",
                           lib = "font-awesome",
                           class = "fa-lg")),
      menuItem(text = "Check logic",
               tabName = "logic",
               icon = icon(name = "puzzle-piece",
                           lib = "font-awesome",
                           class = "fa-lg")),
      menuItem(text = "Enumerator performance",
               tabName = "enumerator",
               icon = icon(name = "file-text",
                           lib = "font-awesome",
                           class = "fa-lg"))#,
      #menuItem(text = "Standardisation test",
      #         tabName = "standard",
      #         icon = icon(name = "ruler",
      #                     lib = "font-awesome",
      #                     class = "fa-lg")),
      #menuItem(text = "Anthropometric data quality",
      #         tabName = "anthro",
      #         icon = icon(name = "check",
      #                     lib = "font-awesome",
      #                     class = "fa-lg"))
    )
  ),
  ## Body
  dashboardBody(
    ## Specify a custom.css
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "valid.css"),
      HTML(
        "
        <script>
        var socket_timeout_interval
        var n = 0
        $(document).on('shiny:connected', function(event) {
        socket_timeout_interval = setInterval(function)(){
        Shiny.onInputChange('count', n++)
        }, 15000)
        });
        $(document).on('shiny:disconnected', function(event) {
        clearInterval(socket_timeout_interval)
        });
        </script>
        "
      )
    ),
    textOutput("keepAlive"),
    ## Body outputs for every menu item on sidebar
    tabItems(
      ## Body output when 'parameters' menu is selected
      tabItem(tabName = "settings",
        fluidRow(
          box(title = "Global survey parameters",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            dateInput(inputId = "surveyStart",
              label = "Start date of survey",
              value = NULL
            ),
            dateInput(inputId = "surveyEnd",
              label = "End date of survey",
              value = NULL
            )
          ),
          box(title = "Import data settings",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            dateInput(inputId = "startDate",
              label = "Start date",
              value = NULL,
              max = Sys.Date()
            ),
            dateInput(inputId = "endDate",
              label = "End date",
              value = Sys.Date(),
              max = Sys.Date()
            ),
            textInput(inputId = "username",
              label = "ONA username",
              placeholder = "username"
            ),
            passwordInput(inputId = "password",
              label = "ONA password",
              value = "",
              placeholder = "password"
            ),
            div(style="display:inline-block; vertical-align:middle;
                float:left; padding-left:5px; padding-right:5px;",
              uiOutput("getDataButton")
            ),
            div(style="display:inline-block; vertical-align:middle;
                float:left; padding-left:5px; padding-right:5px;",
              uiOutput("viewDataButton")
            )
          ),
          box(title = "Save data settings",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            radioButtons(inputId = "dataFormat",
              label = "Select data format",
              choices = c("Excel" = "xls",
                          "CSV" = "csv"),
              selected = "csv",
              inline = TRUE
            ),
            textInput(inputId = "fileName",
              label = "Specify filename",
              value = "surveyData",
              placeholder = "Enter filename"
            ),
            div(style="display:inline-block;
              vertical-align:middle;
              float:left; padding-left:5px; padding-right:5px;",
              uiOutput("saveDataButton")
            )
          )
        ),
        fluidRow(
          uiOutput("viewDataBox")
        )
      ),
      tabItem(tabName = "track",
        fluidRow(
          box(title = "Select variables for tracking progress",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            selectInput(inputId = "var1",
              label = "Check variable 1",
              choices = c("Interview Date" = "intrv_date",
                          "State" = "geo_state",
                          "Township" = "geo_town",
                          "Village tract" = "geo_vt",
                          "Village/Ward" = "geo_villward",
                          "Survey team" = "svy_team",
                          "Supervisor" = "superv_name",
                          "Enumerator" = "enu_name"),
              selected = "intrv_date"
            ),
            selectInput(inputId = "var2",
              label = "Check variable 2",
              choices = NULL
            ),
            selectInput(inputId = "var3",
              label = "Check variable 3",
              choices = NULL
            )
          ),
          uiOutput("plotSettings")
        ),
        fluidRow(
          uiOutput("trackingPlotBox")
        )
      ),
      tabItem(tabName = "logic",
        fluidRow(
          tabBox(title = "Check logic",
            id = "logicTabs",
            width = 12,
            tabPanel(title = "Duplicates",
              fluidRow(
                valueBoxOutput(outputId = "totalDuplicates",
                  width = 3
                )
              ),
              hr(),
              DT::dataTableOutput("duplicateTable")
            ),
            tabPanel(title = "No consent",
              fluidRow(
                valueBoxOutput(outputId = "totalNoConsent",
                  width = 3
                )
              ),
              hr(),
              DT::dataTableOutput("consentTable")
            ),
            tabPanel(title = "Outside survey date",
              fluidRow(
                valueBoxOutput(outputId = "totalOutsideSurvey",
                  width = 3
                )
              ),
              hr(),
              DT::dataTableOutput("outsideTable")
            )
          )
        )
      ),
      tabItem(tabName = "enumerator",
        fluidRow(
          box(title = "Variables to check enumerator performance",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            selectInput(inputId = "vars",
              label = "Select variables",
              choices = c("Choose..." = "."),
            )
          ),
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
        ),
        fluidRow(
          uiOutput("performancePlotBox")
        )
      )#,
      #tabItem(tabName = "standard",
      #  fluidRow()
      #),
      #tabItem(tabName = "anthro",
      #  fluidRow()
      #)
    )
  )
)
