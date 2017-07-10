################################################################################
#
# User interaction
#
################################################################################
#
# Create fluid page layout for user interactivity
#
navbarPage(title = "Urban Water and Sanitation Survey", 
           id = "chosenTab", inverse = FALSE, theme = shinytheme("cerulean"),
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
                      choices = list("Mean number of household members" = "nMembers")),
          #
          #
          #
          conditionalPanel(condition = "input.tabs1 == 11",
            #
            #
            #
            selectInput(inputId = "x.demographics", 
                        label = "Stratify by", 
                        choices = list(None = ".",
                                       "Survey Area" = "zone", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "pQuintile")),
            #
            #
            #
            sliderInput(inputId = "bins.demographics", "Number of bins:",
                        min = 1, max = 5, value = 1)),
          #
          #
          #
          conditionalPanel(condition = "input.tabs1 == 12",
              #
              #
              #
              selectInput(inputId = "palette.demographics",
                          label = "Select colour palette",
                          choices = list("Sequential" = c("Blues" = "Blues",
                                                          "Blue to Green" = "BuGn",
                                                          "Blue to Purple" = "BuPu",
                                                          "Green to Blue" = "GnBu",
                                                          "Greens" = "Greens",
                                                          "Greys" = "Greys",
                                                          "Oranges" = "Oranges",
                                                          "Orange to Red" = "OrRd",
                                                          "Purples" = "Purples",
                                                          "Purple to Blue" = "PuBu",
                                                          "Purple to Blue to Green" = "PuBuGn",
                                                          "Purple to Red" = "PuRd",
                                                          "Reds" = "Reds",
                                                          "Yellow to Green" = "YlGn",
                                                          "Yellow to Green to Blue" = "YlGnBu",
                                                          "Yellow to Orange to Brown" = "YlOrBr",
                                                          "Yellow to Orange to Red" = "YlOrRd"),
                                         "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                         "Pink to Yellow to Green" = "PiYG",
                                                         "Purple to Red to Green" = "PRGn",
                                                         "Purple to Orange" = "PuOr",
                                                         "Red to Blue" = "RdBu",
                                                         "Red to Grey" = "RdGy",
                                                         "Red to Yellow to Blue" = "RdYlBu",
                                                         "Red to Yellow to Green" = "RdYlGn",
                                                         "Spectral" = "Spectral")),
                          selected = "YlGnBu"),
              #
              #
              #
              selectInput(inputId = "map.colour.demographics", 
                          label = "Select colour mapping method", 
                          choices = list("Linear" = "linear", 
                                         "Equal Interval" = "interval", 
                                         "Quantile" = "quantile"),
                          selected = "interval"),
              #
              #
              #
              uiOutput("map.bins.demographics.control"),
              #
              #
              #
              uiOutput("map.quantile.demographics.control")            
            )
          ),
        #
        #
        #                           
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs1",
          #
          #
          #
          tabPanel(title = "Charts", value = 11, 
                   withSpinner(plotOutput("demographics"), type = 5)),
          #
          #
          #
          tabPanel(title = "Maps", value = 12, 
                   withSpinner(leafletOutput("map.demographics", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
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
          conditionalPanel(condition = "input.tabs2 == 21",
            #
            #
            #
            selectInput(inputId = "x.poverty", 
                        label = "Select primary stratification", 
                        choices = list(None = ".",
                                       "Survey Area" = "zone", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "pQuintile")),
            #
            #
            #
            sliderInput(inputId = "bins.poverty", label = "Number of bins:",
                        min = 1, max = 5, value = 3, step = 0.25)),
          #
          #
          #
          conditionalPanel(condition = "input.tabs2 == 22",
            #
            #
            #
            selectInput(inputId = "palette.poverty",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                       "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                       "Pink to Yellow to Green" = "PiYG",
                                                       "Purple to Red to Green" = "PRGn",
                                                       "Purple to Orange" = "PuOr",
                                                       "Red to Blue" = "RdBu",
                                                       "Red to Grey" = "RdGy",
                                                       "Red to Yellow to Blue" = "RdYlBu",
                                                       "Red to Yellow to Green" = "RdYlGn",
                                                       "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.poverty", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.poverty.control"),
            #
            #
            #
            uiOutput("map.quantile.poverty.control")            
          )
        ),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs2",
          #
          #
          #
          tabPanel(title = "Chart", value = 21,
                   withSpinner(plotOutput("poverty"), type = 5)),
          #
          #
          #
          tabPanel(title = "Maps", value = 22,
                   withSpinner(leafletOutput("map.poverty", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
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
          conditionalPanel(condition = "input.tabs3 == 31",            
            #
            #
            #
            selectInput(inputId = "x.ladder", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            #
            #
            selectInput(inputId = "y.ladder", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          #
          #
          conditionalPanel(condition = "input.tabs3 == 32",
            #
            #
            #
            selectInput(inputId = "indicator.ladder",
                        label = "Select indicator",
                        choices = list("Select indicator" = "")),
            #
            #
            #
            selectInput(inputId = "palette.ladder",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                       "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                       "Pink to Yellow to Green" = "PiYG",
                                                       "Purple to Red to Green" = "PRGn",
                                                       "Purple to Orange" = "PuOr",
                                                       "Red to Blue" = "RdBu",
                                                       "Red to Grey" = "RdGy",
                                                       "Red to Yellow to Blue" = "RdYlBu",
                                                       "Red to Yellow to Green" = "RdYlGn",
                                                       "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.ladder", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.ladder.control"),
            #
            #
            #
            uiOutput("map.quantile.ladder.control")            
          )
        ),
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs3",
          #
          #
          #
          tabPanel(title = "Charts", value = 31,
                   withSpinner(plotOutput("ladder"), type = 5)), 
          #
          #
          #
          tabPanel(title = "Maps", value = 32,
                   withSpinner(leafletOutput("map.ladder", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
    )
  ),
  #
  # Other water indicators
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
          conditionalPanel(condition = "input.tabs4 == 41",
            #
            #
            #
            selectInput(inputId = "x.water", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            #
            #
            selectInput(inputId = "y.water", 
                        label = "Select secondary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"),
                        selected = "type")),
          #
          #
          #
          conditionalPanel(condition = "input.tabs4 == 42",
            #
            #
            #
            selectInput(inputId = "palette.water",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                        "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                        "Pink to Yellow to Green" = "PiYG",
                                                        "Purple to Red to Green" = "PRGn",
                                                        "Purple to Orange" = "PuOr",
                                                        "Red to Blue" = "RdBu",
                                                        "Red to Grey" = "RdGy",
                                                        "Red to Yellow to Blue" = "RdYlBu",
                                                        "Red to Yellow to Green" = "RdYlGn",
                                                        "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.water", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.water.control"),
            #
            #
            #
            uiOutput("map.quantile.water.control")            
          )
        ),            
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs4",
          #
          #
          #
          tabPanel(title = "Charts", value = 41,
                   withSpinner(plotOutput("water"), type = 5)), 
          #
          #
          #
          tabPanel(title = "Maps", value = 42,
                   withSpinner(leafletOutput("map.water", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
      )
    ),
  #
  # Other sanitation indicators
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
          conditionalPanel(condition = "input.tabs5 == 51",
            #
            #
            #
            selectInput(inputId = "x.sanitation", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            #
            #
            selectInput(inputId = "y.sanitation", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          #
          #
          conditionalPanel(condition = "input.tabs5 == 52",
            #
            #
            #
            selectInput(inputId = "palette.sanitation",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                        "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                        "Pink to Yellow to Green" = "PiYG",
                                                        "Purple to Red to Green" = "PRGn",
                                                        "Purple to Orange" = "PuOr",
                                                        "Red to Blue" = "RdBu",
                                                        "Red to Grey" = "RdGy",
                                                        "Red to Yellow to Blue" = "RdYlBu",
                                                        "Red to Yellow to Green" = "RdYlGn",
                                                        "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.sanitation", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.sanitation.control"),
            #
            #
            #
            uiOutput("map.quantile.sanitation.control")            
          )
        ),             
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs5",
          #
          #
          #
          tabPanel(title = "Charts", value = 51,
                   withSpinner(plotOutput("sanitation"), type = 5)), 
          #
          #
          #
          tabPanel(title = "Maps", value = 52,
                   withSpinner(leafletOutput("map.sanitation", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
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
          conditionalPanel(condition = "input.tabs6 == 61",
            #
            #
            #
            selectInput(inputId = "x.hygiene", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            #
            #
            selectInput(inputId = "y.hygiene", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          #
          #
          conditionalPanel(condition = "input.tabs6 == 62",
            #
            #
            #
            selectInput(inputId = "palette.hygiene",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                        "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                        "Pink to Yellow to Green" = "PiYG",
                                                        "Purple to Red to Green" = "PRGn",
                                                        "Purple to Orange" = "PuOr",
                                                        "Red to Blue" = "RdBu",
                                                        "Red to Grey" = "RdGy",
                                                        "Red to Yellow to Blue" = "RdYlBu",
                                                        "Red to Yellow to Green" = "RdYlGn",
                                                        "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.hygiene", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.hygiene.control"),
            #
            #
            #
            uiOutput("map.quantile.hygiene.control")            
          )
        ),             
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs6",
          #
          #
          #
          tabPanel(title = "Charts", value = 61,
                   withSpinner(plotOutput("hygiene"), type = 5)),
          #
          #
          #
          tabPanel(title = "Maps", value = 62,
                   withSpinner(leafletOutput("map.hygiene", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
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
          conditionalPanel(condition = "input.tabs7 == 71",
            #
            #
            #
            selectInput(inputId = "x.overall", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #  
            #
            #                         
            selectInput(inputId = "y.overall", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          #
          #
          conditionalPanel(condition = "input.tabs7 == 72",
            #
            #
            #
            selectInput(inputId = "indicator.overall",
                        label = "Select indicator",
                        choices = list("No access to adequate services" = "overall4",
                                       "Adequate sanitation only" = "overall3",
                                       "Adequate water only" = "overall2",
                                       "Adequate water and sanitation" = "overall1")),
            #
            #
            #
            selectInput(inputId = "palette.overall",
                        label = "Select colour palette",
                        choices = list("Sequential" = c("Blues" = "Blues",
                                                        "Blue to Green" = "BuGn",
                                                        "Blue to Purple" = "BuPu",
                                                        "Green to Blue" = "GnBu",
                                                        "Greens" = "Greens",
                                                        "Greys" = "Greys",
                                                        "Oranges" = "Oranges",
                                                        "Orange to Red" = "OrRd",
                                                        "Purples" = "Purples",
                                                        "Purple to Blue" = "PuBu",
                                                        "Purple to Blue to Green" = "PuBuGn",
                                                        "Purple to Red" = "PuRd",
                                                        "Reds" = "Reds",
                                                        "Yellow to Green" = "YlGn",
                                                        "Yellow to Green to Blue" = "YlGnBu",
                                                        "Yellow to Orange to Brown" = "YlOrBr",
                                                        "Yellow to Orange to Red" = "YlOrRd"),
                                        "Divergent" = c("Brown to Blue to Green" = "BrBG",
                                                        "Pink to Yellow to Green" = "PiYG",
                                                        "Purple to Red to Green" = "PRGn",
                                                        "Purple to Orange" = "PuOr",
                                                        "Red to Blue" = "RdBu",
                                                        "Red to Grey" = "RdGy",
                                                        "Red to Yellow to Blue" = "RdYlBu",
                                                        "Red to Yellow to Green" = "RdYlGn",
                                                        "Spectral" = "Spectral")),
                        selected = "YlGnBu"),
            #
            #
            #
            selectInput(inputId = "map.colour.overall", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            #
            #
            uiOutput("map.bins.overall.control"),
            #
            #
            #
            uiOutput("map.quantile.overall.control")            
          )
        ),             
        #
        #
        #
        width = 3),
      #
      #
      #
      mainPanel(
        #
        #
        #
        tabsetPanel(type = "tabs", id = "tabs7",
          #
          #
          #
          tabPanel(title = "Charts", value = 71,
                   withSpinner(plotOutput("overall"), type = 5)),
          #
          #
          #
          tabPanel(title = "Maps", value = 72,
                   withSpinner(leafletOutput("map.overall", width = "100%", height = 500), type = 5))
        ),
      #
      #
      #
      width = 9)
      )
    )
  )