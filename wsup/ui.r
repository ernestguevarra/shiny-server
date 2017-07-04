################################################################################
#
# User interaction
#
################################################################################
#
# Create fluid page layout for user interactivity
#
navbarPage(title = "Water and Sanitation for the Urban Poor", 
           id = "chosenTab", inverse = FALSE, theme = shinytheme("cerulean"),
           header = h4(style="text-align:left; margin-left:20px",
                        "Urban Water and Sanitation Survey"),
  #
  #
  #
  tabPanel(title = "Demographics", value = 1,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 1",
          #
          #
          #
          selectInput(inputId = "country1", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city1",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.demographics", 
                      label = "Select Indicator Set", 
                      choices = list("Mean number of households" = "nMembers")),
          #
          #
          #
          selectInput(inputId = "x.demographics", 
                      label = "Stratify by", 
                      choices = list(None = ".",
                                     "Survey Area" = "zone", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "pQuintile"))),
        #
        #
        #                           
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("demographics"), type = 5), width = 9)
      )
    ), 
  #
  #
  #
  tabPanel(title = "Poverty", value = 2,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 2",
          #
          #
          #
          selectInput(inputId = "country2", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city2",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.poverty", 
                      label = "Select Indicator Set", 
                      choices = list("Progress out of Poverty Index" = "ppi",
                                     "Poverty Likelihood ($1.25 a day)" = "ppp125",
                                     "Wealth Quintle" = "pQuintile"),
                      selected = "ppi"),
          #
          #
          #
          selectInput(inputId = "x.poverty", 
                      label = "Select primary stratification", 
                      choices = list(None = ".",
                                     "Survey Area" = "zone", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "pQuintile"))),

        width = 3),

      mainPanel(withSpinner(plotOutput("poverty"), type = 5), width = 9)
      )
    ),
  #
  #
  #
  tabPanel(title = "Service Ladders", value = 3,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 3",
          #
          #
          #
          selectInput(inputId = "country3", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city3",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.ladder", 
                      label = "Select Indicator Set", 
                      choices = list("Water Service Ladder" = "waterSet1",
                                     "Sanitation Service Ladder" = "sanSet1",
                                     "Handwashing Service Ladder" = "handSet"),
                      selected = "waterSet1"),
          #
          #
          #
          selectInput(inputId = "x.ladder", 
                      label = "Select primary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth")),

          selectInput(inputId = "y.ladder", 
                      label = "Select secondary stratification", 
                      choices = list(None = ".", 
                                     "Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth"))),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("ladder"), type = 5), width = 9)
      )
    ),
  #
  # Water indicators menu
  #
  tabPanel(title = "Water", value = 4,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 4",
          #
          #
          #
          selectInput(inputId = "country4", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city4",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.water", 
                      label = "Select Indicator Set", 
                      choices = list("Sufficient and sustained access" = "accessWater",
                                     "Adequate physical access" = "water7a",
                                     "Mean expenditure" = "water12",
                                     "Good self-perceived quality" = "water14a",
                                     "Safe storage" = "water18",
                                     "Formal service provision" = "water2a",
                                     "Formal service supply maintenance" = "water17"),
                      selected = "accessWater"),
          #
          #
          #
          selectInput(inputId = "x.water", 
                      label = "Select primary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth")),

          selectInput(inputId = "y.water", 
                      label = "Select secondary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth"),
                      selected = "type")),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("water"), type = 5), width = 9)
      )
    ),
  #
  # Sanitation indicators menu
  #
  tabPanel(title = "Sanitation", value = 5,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 5",
          #
          #
          #
          selectInput(inputId = "country5", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city5",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.sanitation", 
                      label = "Select Indicator Set", 
                      choices = list("Adequate facility" = "adequateSan",
                                     "Able to use and actually use facility" = "accessSan",
                                     "Mean time to facility" = "san13",
                                     "Adequate physcal access" = "san13a",
                                     "Mean expenditure" = "san14",
                                     "Appropriate/acceptable facility" = "acceptSan",
                                     "Sanitary disposal of child's faeces" = "san12",
                                     "Formal service operator for maintenance" = "san25",
                                     "Formal pit emptier" = "san35"),
                      selected = "adequateSan"),
          #
          #
          #
          selectInput(inputId = "x.sanitation", 
                      label = "Select primary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth")),

          selectInput(inputId = "y.sanitation", 
                      label = "Select secondary stratification", 
                      choices = list(None = ".", 
                                     "Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth"))),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("sanitation"), type = 5), width = 9)
      )
    ),
  #
  # Overall indicators menu
  #
  tabPanel(title = "Hygiene", value = 6,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 6",
          #
          #
          #
          selectInput(inputId = "country6", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city6",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.hygiene", 
                      label = "Select Indicator Set", 
                      choices = list("Adequate menstrual hygiene materials" = "san28",
                                     "Good menstrual hygiene behaviour" = "jmpWomenHygiene",
                                     "Use of sanitation facility during menstruation" = "jmpWoman"),
                      selected = "san28"),
          #
          #
          #
          selectInput(inputId = "x.hygiene", 
                      label = "Select primary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth")),

          selectInput(inputId = "y.hygiene", 
                      label = "Select secondary stratification", 
                      choices = list(None = ".", 
                                     "Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth"))),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("hygiene"), type = 5), width = 9)
      )
    ),
  #
  #
  #
  tabPanel(title = "Overall", value = 7,
    #
    #
    #
    sidebarLayout(
      #
      #
      #
      sidebarPanel(
        #
        #
        #
        conditionalPanel(condition = "input.chosenTab == 7",
          #
          #
          #
          selectInput(inputId = "country7", 
                      label = "Select Country Survey",
                      choices = unique(areaResultsLong$country)), 
          #
          #
          #
          selectInput(inputId = "city7",
                      label = "Select City Survey",
                      choices = c(None = ".")),
          #
          #
          #
          selectInput(inputId = "z.overall", 
                      label = "Select Indicator Set", 
                      choices = list("Overall" = "overallSet1")),
          #
          #
          #
          selectInput(inputId = "x.overall", 
                      label = "Select primary stratification", 
                      choices = list("Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth")),
                                     
          selectInput(inputId = "y.overall", 
                      label = "Select secondary stratification", 
                      choices = list(None = ".", 
                                     "Survey Area" = "surveyArea", 
                                     "Area Type" = "type", 
                                     "Wealth Quintile" = "wealth"))),
        #
        #
        #                           
        width = 3),
      #
      #
      #
      mainPanel(withSpinner(plotOutput("overall"), type = 5), width = 9)
      )
    ), 
  #
  #
  #
  tabPanel(title = "Maps", leafletOutput("map")) 
  )
