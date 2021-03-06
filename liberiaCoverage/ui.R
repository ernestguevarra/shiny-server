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
#
# Define UI for application
#
ui <- dashboardPage(
  skin = "red",
  #
  # Header
  #
  dashboardHeader(
    title = "Liberia Coverage Surveys",
    titleWidth = 300),
  #
  # Sidebar
  #
  dashboardSidebar(
    width = 300,
    sidebarSearchForm(
      textId = "searchText",
      buttonId = "searchButton"
    ),
    #
    # Sidebar menu
    #
    sidebarMenu(
      id = "tabs",
      menuItem(text = "Design", 
        tabName = "design", 
        icon = icon(name = "pencil", 
                    lib = "font-awesome",
                    class = "fa-lg")),
      menuItem(text = "Collect", 
        tabName = "collect",
        icon = icon(name = "tablet",
                    lib = "font-awesome",
                    class = "fa-lg")),
      menuItem(text = "Process", 
        tabName = "process",
        icon = icon(name = "database",
                    lib = "font-awesome",
                    class = "fa-lg")),
      menuItem(text = "Analyse", 
        tabName = "analyse",
        icon = icon(name = "line-chart",
                    lib = "font-awesome",
                    class = "fa-lg")),
      menuItem(text = "Report", 
        tabName = "report",
        icon = icon(name = "file-text",
                    lib = "font-awesome",
                    class = "fa-lg"))
    )
  ),
  #
  # Body
  #
  dashboardBody(
    #
    # Specify a custom.css
    #
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    #
    # Body outputs for every menu item on sidebar
    #
    tabItems(
      #
      # Body output when 'design' menu is selected
      #
      tabItem(tabName = "design",
        fluidRow(
          conditionalPanel(condition = "input.design == 'indicators'",
            box(title = "Select Indicators",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              checkboxGroupInput(inputId = "designIndicators",
                label = "Which indicators are to be assessed?",
                choices = c("SAM treatment coverage" = "sam", 
                            "Vitamin A supplementation coverage" = "vita",
                            "FeFol supplementation coverage" = "fefol",
                            "Micronutrient powder supplementation coverage" = "mnp",
                            "Infant and young child feeding counselling coverage" = "iycf"),
                selected = NULL)
            )
          ),
          conditionalPanel(condition = "input.design == 'sampsize'",
            box(title = "Sample size parameters",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              selectInput(inputId = "zValue",
                label = "Confidence interval",
                choices = list("96% CI ( z-value: 2.05 )" = "2.05",
                               "95% CI ( z-value: 1.96 )" = "1.96",
                               "92% CI ( z-value: 1.75 )" = "1.75",
                               "90% CI ( z-value: 1.645 )" = "1.645"),
                selected = "1.96"),
              sliderInput(inputId = "sampSizeProp",
                label = "Proportion/prevalence (p)",
                min = 0, max = 1, value = 0.50, step = 0.01),
              sliderInput(inputId = "sampSizePrec",
                label = "Level of precision (c)",
                min = 0.03, max = 0.15, value = 0.10, step = 0.01),
              hr(),
              checkboxInput(inputId = "sampSizeFpc",
                label = "Apply finite population correction",
                value = FALSE),
              conditionalPanel(condition = "input.sampSizeFpc",
                numericInput(inputId = "sampSizeFpcPop",
                  label = "Population size",
                  value = 10000,
                  min = 1, max = 100000, step = 1)
              ),
              hr(),
              radioButtons(inputId = "inputDeffType",
                label = "Specify/calculate design effect (DEFF)",
                choices = c("Specify" = "specify", 
                            "Calculate" = "calculate"),
                selected = "specify",
                inline = TRUE),
              conditionalPanel(condition = "input.inputDeffType == 'specify'",
                sliderInput(inputId = "inputDeffValue",
                  label = "Specify design effectd (DEFF)",
                  value = 2.0,
                  min = 1.0, max = 10.0, step = 0.1)
              ),
              conditionalPanel(condition = "input.inputDeffType == 'calculate'",
                fileInput(inputId = "inputDeffFile",
                  label = "Upload CSV dataset file for DEFF calculation",
                  accept = c("text/csv", 
                             "text/comma-separated-values,text/plain", 
                             ".csv")),
                selectInput(inputId = "inputDeffVar",
                  label = "Select variable name of indicator to test",
                  choices = c("Select variable name" = "")),
                selectInput(inputId = "inputDeffCluster",
                  label = "Select variable name of survey cluster",
                  choices = c("Select variable name" = "")),
                sliderInput(inputId = "inputDeffClusterSize",
                  label = "No. of samples per cluster planned for survey",
                  min = 0, max = 30, step = 1, value = 10)
              ),
              br(),
              actionButton(inputId = "calcSampSize",
                label = "Calculate",
                icon = icon(name = "calculator", 
                            lib = "font-awesome", 
                            class = "fa-lg")
              ),
              actionButton(inputId = "calcSampSizeReset",
                label = "Reset",
                icon = icon(name = "refresh",
                            lib = "font-awesome",
                            class = "fa-lg")
              )
            )
          ),
          conditionalPanel(condition = "input.design == 'stage1'",
            box(title = "Stage 1 sampling parameters",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              shinyjs::useShinyjs(),            
              selectInput(inputId = "mapSamplingAreaType",
                label = "Select area type to sample",
                choices = list("Choose one" = "",
                               "Country" = "country",
                               "County" = "county",
                               "District" = "district"),
                selected = NULL),
              conditionalPanel(condition = "input.mapSamplingAreaType == 'county'",
                selectInput(inputId = "mapSamplingCounty",
                  label = "Select counties to sample",
                  choices = list("Select county" = "",
                                 "Counties" = counties$admin1name),
                  selected = NULL)
              ),
              conditionalPanel(condition = "input.mapSamplingAreaType == 'district'",
                selectInput(inputId = "mapSamplingDistrict",
                  label = "Select districts to sample",
                  choices = list("Select district" = "",
                                 "Districts" = districts$admin2Name),
                  selected = NULL)
              ),
              conditionalPanel(condition = "input.mapSamplingAreaType == 'country' | input.mapSamplingCounty != '' | input.mapSamplingDistrict != ''",
                hr(),
                h5("Spatial sample settings"),
                selectInput(inputId = "mapSamplingSpec",
                  label = "Specify spatial grid parameter to use",
                  choices = c("Grid area" = "area",
                              "Number of grids" = "n",
                              "Max distance to sampling point" = "d"),
                  selected = "area"),
                conditionalPanel(condition = "input.mapSamplingSpec == 'area'",
                  numericInput(inputId = "mapSamplingGridArea",
                    label = "Set grid area size (in sq kms)",
                    value = 100, min = 5, max = 500, step = 5)
                ),
                conditionalPanel(condition = "input.mapSamplingSpec == 'n'",
                  numericInput(inputId = "mapSamplingGridNumber",
                    label = "Set grid number",
                    value = 20, min = 16, max = 30, step = 1)
                ),
                conditionalPanel(condition = "input.mapSamplingSpec == 'd'",
                  numericInput(inputId = "mapSamplingGridDist",
                    label = "Set max distance to sampling point (in kms)",
                    value = 10, min = 5, max = 30, step = 1)
                ),
                numericInput(inputId = "mapSamplingSettlementsNumber",
                  label = "No. of settlements per sampling point",
                  value = 1, min = 1, max = 10, step = 1),
                br(),
                conditionalPanel(condition = "input.mapSamplingAreaType == 'country'",
                  actionButton(inputId = "mapSamplingPlotCountry",
                    label = "",
                    icon = icon(name = "th",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  actionButton(inputId = "mapSamplingPlotCountryReset",
                    label = "",
                    icon = icon(name = "refresh",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  downloadButton(outputId = "samplingListDownloadCountry",
                    label = "",
                    icon = icon(name = "download",
                                lib = "font-awesome",
                                class = "fa-lg")
                  )
                ),
                conditionalPanel(condition = "input.mapSamplingAreaType == 'county'",
                  actionButton(inputId = "mapSamplingPlotCounty",
                    label = "",
                    icon = icon(name = "th",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  actionButton(inputId = "mapSamplingPlotCountyReset",
                    label = "",
                    icon = icon(name = "refresh",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  downloadButton(outputId = "samplingListDownloadCounty",
                    label = "",
                    icon = icon(name = "download",
                                lib = "font-awesome",
                                class = "fa-lg")
                  )
                ),
                conditionalPanel(condition = "input.mapSamplingAreaType == 'district'",
                  actionButton(inputId = "mapSamplingPlotDistrict",
                    label = "",
                    icon = icon(name = "globe",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  actionButton(inputId = "mapSamplingPlotDistrictReset",
                    label = "",
                    icon = icon(name = "refresh",
                                lib = "font-awesome",
                                class = "fa-lg")
                  ),
                  downloadButton(outputId = "samplingListDownloadDistrict",
                    label = "",
                    icon = icon(name = "download",
                                lib = "font-awesome",
                                class = "fa-lg")
                  )
                )
              )
            )
          ),
          tabBox(selected = "indicators",
            id = "design",
            title = "Design",
            width = 8,
            side = "right",
            tabPanel(title = "Stage 1",
              value = "stage1",
              fluidRow(
                box(title = "Stage 1 Sampling",
                  solidHeader = FALSE,
                  status = "danger",
                  width = 12,
                  leafletOutput("mapSampling", height = 500)
                )
              ),
              fluidRow(
                conditionalPanel(condition = "input.mapSamplingPlotCountry > 0 | input.mapSamplingPlotCounty > 0 | input.mapSamplingPlotDistrict > 0",
                  box(title = "Stage 1 sample list",
                    solidHeader = TRUE,
                    status = "danger",
                    width = 12,
                    DT::dataTableOutput("mapSamplingTable")
                  )
                )
              )
            ),
            tabPanel(title = "Sample Size",
              value = "sampsize",
              #withMathJax(),
              #fluidRow(
              #  box(title = "Sample size calculations",
              #    solidHeader = FALSE,
              #    status = "danger",
              #    width = 12,
              #    uiOutput("sampSizeCalculations")
              #  )
              #),
              shinyjs::useShinyjs(),
              conditionalPanel(condition = "input.calcSampSize != 0",
                fluidRow(
                  box(title = textOutput("sampSizeHeader"),
                    solidHeader = FALSE,
                    status = "danger",
                    width = 12,
                    valueBoxOutput("confIntBox"),
                    valueBoxOutput("precisionBox"),
                    valueBoxOutput("clusterSizeBox"),
                    valueBoxOutput("iccBox"),
                    valueBoxOutput("deffBox"),
                    valueBoxOutput("sampSizeBox")
                  )
                )
              )
            ),
            tabPanel(title = "Indicators",
              value = "indicators",
              conditionalPanel(condition = "input.designIndicators.length > 0",
                fluidRow(
                  box(title = "Indicator Sets",
                    solidHeader = FALSE,
                    status = "danger",
                    width = 12,
                    withMathJax(),
                    uiOutput("descriptionImam"),
                    uiOutput("descriptionVita"),
                    uiOutput("descriptionFefol"),
                    uiOutput("descriptionMnp"),
                    uiOutput("descriptionIycf")
                  )
                )
              )
            )
          )
        )
      ),
      #
      # Body output when 'collect' menu is selected
      #
      tabItem(tabName = "collect",
        tabBox(selected = "papi",
          title = "Collect",
          width = 12,
          side = "right",
          tabPanel(title = "Open Data Kit",
            value = "odk",
            h4("Digital data collection using Open Data Kit"),
            uiOutput("collectOdk")),
          tabPanel(title = "Pen and paper",
            value = "papi",
            h4("Pen and Paper Interviews"),
            uiOutput("collectPapi")
          )
        )
      ),
      #
      # Body output when 'process' menu is selected
      #
      tabItem(tabName = "process",
        fluidRow(
          conditionalPanel(condition = "input.process == 'processData'",
            box(title = "Indicators",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              checkboxGroupInput(inputId = "inputIndicators",
                label = "Which indicators are to process?",
                choices = c("IMAM coverage", 
                            "Vitamin A supplementation coverage",
                            "FeFol supplementation coverage",
                            "Micronutrient powder supplementation coverage",
                            "Infant and young child feeding counselling coverage"),
                selected = c("IMAM coverage", 
                             "Vitamin A supplementation coverage",
                             "FeFol supplementation coverage",
                             "Micronutrient powder supplementation coverage",
                             "Infant and young child feeding counselling coverage")
              ),
              br(),
              actionButton(inputId = "inputProcessAction",
                label = "Process",
                icon = icon(name = "database", 
                            lib = "font-awesome",
                            class = "fa-lg"))
            )
          ),
          conditionalPanel(condition = "input.process == 'checkData'",
            box(title = "Check data parameters",
              solidHeader = TRUE,
              status = "danger",
              width = 4)
          ),
          conditionalPanel(condition = "input.process == 'coverageData'",
            box(title = "Input Coverage Data",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              radioButtons(inputId = "inputDataType2",
                label = "How will coverage data be inputted?",
                choices = c("Upload data file" = "upload", 
                            "Get data from ODK server" = "odk")),
              br(),
              conditionalPanel(condition = "input.inputDataType2 == 'upload'",
                fileInput(inputId = "inputDataRaw2",
                  label = "Upload raw coverage data to process",
                  accept = c("text/csv",
                             "text/comma-separated-values,text/plain",
                             ".csv"))
              ),
              conditionalPanel(condition = "input.inputDataType2 == 'odk'",
                radioButtons(inputId = "inputOdkData2",
                  label = "Pull data from ODK remote or local?",
                  choices = c(Remote = "remote", Local = "local")),
                br(),
                conditionalPanel(condition = "input.inputOdkData2 == 'remote'",
                  textInput(inputId = "inputOdkUrl2",
                    label = "Remote URL",
                    placeholder = "https://odk.ona.io"),
                  textInput(inputId = "inputOdkUsername2",
                    label = "Username",
                    value = "cadnihead"),
                  textInput(inputId = "inputOdkPassword2",
                    label = "Password",
                    value = "kEv-hAB-Arb-6Cn"),
                  textInput(inputId = "inputOdkFormId2a",
                    label = "Form ID",
                    value = "liberiaCoverage")
                ),
                conditionalPanel(condition = "input.inputOdkData2 == 'local'",
                  textInput(inputId = "inputOdkDirectory2",
                    label = "Where is the local ODK directory located?",
                    value = getwd()),
                  textInput(inputId = "inputOdkFormId2b",
                    label = "Form ID",
                    value = "liberiaCoverage")
                ),
                conditionalPanel(condition = "input.inputOdkFormId2a != ' ' | input.inputOdkFormId2a != ' '",
                  actionButton(inputId = "inputDataAction2",
                    label = "Pull data",
                    icon = icon(name = "arrow-down",
                                lib = "font-awesome", 
                                class = "fa-lg"))
                )
              )
            )
          ),
          conditionalPanel(condition = "input.process == 'villageData'",
            box(title = "Input Village Data",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              radioButtons(inputId = "inputDataType1",
                label = "How will village data be inputted?",
                choices = c("Upload data file" = "upload", 
                            "Get data from ODK server" = "odk")),
                br(),
                conditionalPanel(condition = "input.inputDataType1 == 'upload'",
                  fileInput(inputId = "inputDataRaw1",
                    label = "Upload raw village data to process",
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv"))
                ),
                conditionalPanel(condition = "input.inputDataType1 == 'odk'",
                  radioButtons(inputId = "inputOdkData1",
                    label = "Pull data from ODK remote or local?",
                    choices = c(Remote = "remote", Local = "local")),
                  br(),
                  conditionalPanel(condition = "input.inputOdkData1 == 'remote'",
                    textInput(inputId = "inputOdkUrl1",
                      label = "Remote URL",
                      placeholder = "https://ona.io/cadnihead"),
                    textInput(inputId = "inputOdkUsername1",
                      label = "Username",
                      value = "cadnihead"),
                    textInput(inputId = "inputOdkPassword1",
                      label = "Password",
                      value = "kEv-hAB-Arb-6Cn"),
                    textInput(inputId = "inputOdkFormId1a",
                      label = "Form ID",
                      value = "liberiaVillageForm")
                  ),
                  conditionalPanel(condition = "input.inputOdkData1 == 'local'",
                    textInput(inputId = "inputOdkDirectory1",
                      label = "Where is the local ODK directory located?",
                      value = getwd()),
                    textInput(inputId = "inputOdkFormId1b",
                      label = "Form ID",
                      value = "liberiaVillageForm")
                  ),
                  conditionalPanel(condition = "input.inputOdkFormId1a != ' ' | input.inputOdkFormId1b != ' '",
                    actionButton(inputId = "inputDataAction1",
                      label = "Pull data",
                      icon = icon(name = "arrow-down", 
                                  lib = "font-awesome",
                                  class = "fa-lg"))
                  )
                )
              )
            ),
            tabBox(title = "Process",
              id = "process",
              selected = "villageData",
              side = "right",
              width = 8,
              tabPanel(title = "Process Indicators",
                value = "processData",
                fluidRow()
              ),
              tabPanel(title = "Check Data",
                value = "checkData",
                fluidRow()
              ),
              tabPanel(title = "Coverage Data",
                value = "coverageData",
                fluidRow(
                  conditionalPanel(condition = "input.inputDataRaw2.length > 0",
                    box(title = NULL,
                      width = 12,
                      status = "danger",
                      DT::dataTableOutput("surveyDataTable")
                    )
                  )
                )
              ),
              tabPanel(title = "Village Data",
                value = "villageData",
                fluidRow(
                  conditionalPanel(condition = "input.inputDataRaw1.length > 0",
                    box(title = NULL,
                      width = 12,
                      status = "danger",
                      DT::dataTableOutput("villageDataTable")
                    )
                  )
                )
              )
            ) 
          )
        ),
      #
      # Body output when 'analyse' menu is selected
      #
      tabItem(tabName = "analyse",
        box(title = "Analyse",
          solidHeader = FALSE,
          status = "danger",
          width = 12,
          fluidRow(
            box(title = "Analysis Parameters",
              solidHeader = TRUE,
              status = "danger",
              width = 4,
              checkboxGroupInput(inputId = "analysisIndicators",
                label = "Select indicators to analyse",
                choices = c("IMAM coverage", 
                            "Vitamin A supplementation coverage",
                            "FeFol supplementation coverage",
                            "Micronutrient powder supplementation coverage",
                            "Infant and young child feeding counselling coverage"),
                selected = c("IMAM coverage", 
                             "Vitamin A supplementation coverage",
                             "FeFol supplementation coverage",
                             "Micronutrient powder supplementation coverage",
                             "Infant and young child feeding counselling coverage")
              ),
              br(),
              numericInput(inputId = "replicates",
                label = "No. of bootstrap replicates",
                value = 399,
                min = 399,
                step = 100),
              br(),
              actionButton(inputId = "analysisAction",
                label = "Analyse",
                icon = icon(name = "line-chart", 
                            lib = "font-awesome",
                            class = "fa-lg"))
            )
          )
        )
      ),
      #
      # Body output when 'report' menu is selected
      #
      tabItem(tabName = "report",
        box(title = "Report",
          solidHeader = FALSE,
          status = "danger",
          width = 12)
      )
    )
  )
)
