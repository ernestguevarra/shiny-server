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
    title = "Myanmar MCCT Checks",
    titleWidth = 300),
  ## Sidebar
  dashboardSidebar(
    width = 300,
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
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
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
          box(title = "Data import settings",
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
            actionButton(inputId = "getData",
              label = "Get data",
              icon = icon(name = "database",
                          lib = "font-awesome",
                          class = "fa-lg")
            )
          ),
          box(title = "Check parameters",
            solidHeader = TRUE,
            status = "primary",
            width = 4
          )
        ),
        fluidRow(
          box(title = "Dataset for checking",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("surveyDataTable")
          )
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
          box(title = "",
            solidHeader = FALSE,
            status = "primary",
            width = 8,
            height = "600px",
            plotOutput(outputId = "trackingPlot")
          )
        )
      ),
      tabItem(tabName = "logic",
        fluidRow(
          box(title = "Duplicates",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("duplicateTable")
          ),
          box(title = "No consent",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("consentTable")
          ),
          box(title = "Outside survey date",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("outsideTable")
          )
        )
      ),
      tabItem(tabName = "enumerator",
        fluidRow(
          box(title = "Variables to check enumerator performance",
            solidHeader = TRUE,
            status = "primary",
            width = 2,
            selectInput(inputId = "vars",
              label = "Select variables",
              choices = c("Choose..." = "."),
            )
          ),
          box(title = "",
            solidHeader = FALSE,
            status = "primary",
            width = 10,
            plotOutput(outputId = "performancePlot")
          )
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
