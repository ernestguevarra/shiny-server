################################################################################
#
#
# This is a Shiny web application to support the implementation of health and
# nutrition coverage surveys in Liberia.
#
# This is the code for the user interface (UI) of the Shiny web application.
#
#
################################################################################


################################################################################
#
# UI for web application
#
################################################################################

## Define UI for application
ui <- dashboardPage(
  skin = "red",
  ## Header
  dashboardHeader(
    title = "Liberia Coverage Surveys",
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
      menuItem(text = "Urban Montserrado", 
        tabName = "gm", 
        icon = icon(name = "pencil", 
                    lib = "font-awesome",
                    class = "fa-lg")),
      menuItem(text = "Grand Bassa", 
        tabName = "gb",
        icon = icon(name = "tablet",
                    lib = "font-awesome",
                    class = "fa-lg"))
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
      ## Body output when 'gm' menu is selected
      tabItem(tabName = "gm",
        fluidRow(
          box(title = "Options",
            status = "primary",
            solidHeader = TRUE,
            width = 4,
            radioButtons(inputId = "round",
              label = "Select round",
              choices = c("Round 1" = "r1",
                          "Round 2" = "r2"),
              selected = "r2"
            ),
            selectInput(inputId = "varLabel",
              label = "Select indicator",
              choices = c("At least one ANC visit" = "ifa1",
                          "Know/heard about iron-folic acid" = "ifa2",
                          "Received/purchased iron-folic acid" = "ifa3",
                          "Consumed iron-folic acid" = "ifa4",
                          "Mean number of days of iron-folic acid consumption" = "ifa5",
                          "Consumed iron-folic acid for at least 90 days" = "ifa6",
                          "Consumed iron-folic acid for 180 days" = "ifa7"),
              selected = "ifa1"
            )
          ),
          box(title = "Map",
            status = "primary",
            solidHeader = TRUE,
            width = 8,
            leafletOutput(outputId = "mapGM")
          ),
          tabBox(id = "gm",
            selected = "ifaGM",
            title = "",
            width = 12,
            tabPanel(title = "IFA",
              value = "ifaGM",
              fluidRow(
                box(title = "Overall estimates",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "ifaPlot")
                ),
                box(title = "Reasons for non-coverage",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "ifaReasons")
                )
              )
            ),
            tabPanel(title = "IYCF",
              value = "iycfGM",
              fluidRow(
                box(title = "Overall estimates",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "icfPlot")
                ),
                box(title = "Reasons for non-coverage",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "icfReasons")
                )
              )
            ),
            tabPanel(title = "MNP",
              value = "mnpGM",
              fluidRow(
                box(title = "Overall estimates",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "mnpPlot")
                ),
                box(title = "Reasons for non-coverage",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "mnpReasons")
                )
              )
            ),
            tabPanel(title = "Vitamin A",
              value = "vitGM",
              fluidRow(
                box(title = "Overall estimates",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "vitPlot")
                ),
                box(title = "Reasons for non-coverage",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "vitReasons")
                )
              )
            ),
            tabPanel(title = "Nutrition Screening",
              value = "screenGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "screenPlot")
                ),
                box(title = "Overall estimates (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput(outputId = "screenTable")
                )
              )
            ),
            tabPanel(title = "IMAM",
              value = "cmamGM",
              fluidRow(
                box(title = "Overall estimates",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "cmamPlot")
                ),
                box(title = "Reasons for non-coverage",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "cmamReasons")
                )
              )
            ),
            tabPanel(title = "Stunting",
              value = "stuntGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "stuntPlot")
                ),
                box(title = "Overall estiamtes (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput("stuntTable")
                )
              )
            ),
            tabPanel(title = "Underweight",
              value = "underweightGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "underweightPlot")
                ),
                box(title = "Overall estimates (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput(outputId = "underweightTable")
                )
              )
            ),
            tabPanel(title = "Wasting (WHZ)",
              value = "whzGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "whzPlot")
                ),
                box(title = "Overall estimates (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput(outputId = "whzTable")
                )
              )
            ),
            tabPanel(title = "Wasting (MUAC)",
              value = "muacGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "muacPlot")
                ),
                box(title = "Overall estimates (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput(outputId = "muacTable")
                )
              )
            ),
            tabPanel(title = "Oedema",
              value = "oedemaGM",
              fluidRow(
                box(title = "Overall estimates (plot)",
                  status = "warning",
                  solidHeader = TRUE,
                  plotlyOutput(outputId = "oedemaPlot")
                ),
                box(title = "Overall estimats (table)",
                  status = "warning",
                  solidHeader = TRUE,
                  tableOutput(outputId = "oedemaTable")
                )
              )
            )
          )
        )
      ),
      ## Body output when 'gb' menu is selected
      tabItem(tabName = "gb",
        fluidRow(
        )
      )
    )
  )
)
