################################################################################
#
# User interactivity
#
################################################################################
#
# Create fluid page tabbed layout for user interactivity
#
navbarPage(title = "Urban Water and Sanitation Survey", 
           id = "chosenTab", inverse = FALSE, theme = shinytheme("cerulean"),
  #
  # Create demographics tab
  #
  tabPanel(title = "Demographics", value = 1, icon = icon("group", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader1")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Add menu when 'Demographics' menu tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 1",
          #
          # Select country
          #
          div(style="display: inline-block;vertical-align:top;",
              selectInput(inputId = "country1", 
                          label = "Country ",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select city
          #
          div(style="display: inline-block;vertical-align:top;",
              selectInput(inputId = "city1",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-heading
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;",
              actionLink(inputId = "info1", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Select indicator
          #
          selectInput(inputId = "z.demographics", 
                      label = "Select indicator",
                      choices = list("Number of household members" = "nMembers")),
          #
          # Add menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 11",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;", 
                actionLink(inputId = "info11", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon")))            
          ),
          #
          # Add menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 12",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;", 
                actionLink(inputId = "info12", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon")))            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 13",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;", 
                actionLink(inputId = "info13", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon")))            
          ),
          #
          # Add menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 11",
            #
            # Select stratification
            #
            selectInput(inputId = "x.demographics", 
                        label = "Stratify by", 
                        choices = list("All Data (No Stratification)" = ".",
                                       "Survey Area" = "zone", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "pQuintile")),
            #
            # Select number of bins for histogram
            #
            sliderInput(inputId = "bins.demographics", 
                        label = "Select bin width",
                        min = 1, max = 5, 
                        value = 1, step = 1)
          ),
          #
          # Add menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 12",
            #
            # Select map colour scheme
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
                        selected = "YlOrBr"),
            #
            # Select mapping colour method
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
            h6(textOutput(outputId = "map.colour.demographics.help1")),
            h6(textOutput(outputId = "map.colour.demographics.help2")),
            h6(textOutput(outputId = "map.colour.demographics.help3")),
            #
            # Bins slider if 'interval' chosen
            #
            uiOutput("map.bins.demographics.control"),
            #
            #
            #
            h6(textOutput(outputId = "map.bins.demographics.help")),
            #
            # Quantiles slider if 'quantile' chosen
            #
            uiOutput("map.quantile.demographics.control")                        
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs1 == 13",
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.demographics.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(indicatorsDF$zone)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.demographics.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(indicatorsDF$type))))                      
          )
        ),
        #
        # Set width of side panel
        #                           
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Name of indicator on header
        #
        h4(textOutput("mainHeader1")),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs1",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 11, 
                   withSpinner(plotOutput("demographics"), type = 5)),
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 12,
                   withSpinner(leafletOutput("map.demographics", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 13,
                   DT::dataTableOutput("table.demographics"))
        ),
      #
      # Set width for main panel
      #
      width = 9)
    )
  ),   
  #
  # Create poverty menu tab
  #
  tabPanel(title = "Poverty", value = 2, icon = icon(name = "money", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader2")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Add menu when 'Poverty' tab menu selected
        #
        conditionalPanel(condition = "input.chosenTab == 2",
          #
          # Select country
          #
          div(style="display: inline-block;vertical-align:top;",
              selectInput(inputId = "country2", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select city
          #
          div(style="display: inline-block;vertical-align:top;",
              selectInput(inputId = "city2",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Add sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;", 
              actionLink(inputId = "info2", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Select indicator
          #
          selectInput(inputId = "z.poverty", 
                      label = "Select Indicator Set", 
                      choices = list("Progress out of Poverty Index" = "ppi",
                                     "Poverty Likelihood ($1.25 a day)" = "ppp125",
                                     "Wealth Quintle" = "pQuintile"),
                      selected = "ppi"),
          #
          # Add menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs2 == 21",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info21", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.poverty", 
                        label = "Stratify by", 
                        choices = list(None = ".",
                                       "Survey Area" = "zone", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "pQuintile")),
            #
            # Select number of bins
            #
            sliderInput(inputId = "bins.poverty", 
                        label = "Select bin width",
                        min = 1, max = 5, 
                        value = 3, step = 1)
          ),                        
          #
          # Add menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs2 == 22",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info22", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),            
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.poverty", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method chosen
            #
            uiOutput("map.bins.poverty.control"),
            #
            # Quantiles slider when 'quantile' method chosen
            #
            uiOutput("map.quantile.poverty.control")            
      ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs2 == 23",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info23", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),                                                                                       
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.poverty.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.poverty.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))
          )
        ),
        #
        # Set width of side panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Name of indicator on header
        #
        h4(textOutput("mainHeader2")),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs2",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Chart", value = 21,
                   withSpinner(plotOutput("poverty"), type = 5)),
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 22,
                   withSpinner(leafletOutput("map.poverty", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 23,
                   DT::dataTableOutput("table.poverty"))                   
        ),
      #
      # Set with of main panel
      #
      width = 9)
    )
  ),
  #
  # Create Service Ladders tab
  #
  tabPanel(title = "Service Ladders", value = 3, icon = icon(name = "bars", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader3")),
        #
        # Add horizontal divider
        #
        hr(),        
        #
        # Menu when 'Service Ladders' tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 3",
          #
          # Select Country
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country3", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select City
          #
          div(style="display: inline-block;vertical-align:middle;",          
              selectInput(inputId = "city3",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-heading
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'info' link
          #
          div(style="display: inline-block;vertical-align:middle;",
              actionLink(inputId = "info3",
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),          
          #
          # Select indicator set
          #
          selectInput(inputId = "z.ladder", 
                      label = "Select Indicator Set", 
                      choices = list("Water Service Ladder" = "waterSet1",
                                     "Sanitation Service Ladder" = "sanSet1",
                                     "Handwashing Service Ladder" = "handSet"),
                      selected = "waterSet1"),
          #
          # Menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs3 == 31",
            #
            # Add whitespace
            #
            br(),
            #
            # Sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info31",
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.ladder", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            # Select secondary stratification
            #
            selectInput(inputId = "y.ladder", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          # Menu when 'Charts' sub-tab not selected
          #
          conditionalPanel(condition = "input.tabs3 != 31",
            #
            # Select indicator based on indicator set selected
            #
            selectInput(inputId = "indicator.ladder",
                        label = "Select indicator",
                        choices = list("Select indicator" = ""))
          ),          
          #
          # Menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs3 == 32",
            #
            # Add whitespace
            #
            br(),
            #
            # Sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info32",
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.ladder", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method chosen
            #
            uiOutput("map.bins.ladder.control"),
            #
            # Quantiles slider when 'quantile" method chosen
            #
            uiOutput("map.quantile.ladder.control")            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs3 == 33",
            #
            # Add whitespace
            #
            br(),
            #
            # Sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info33",
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.ladder.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.ladder.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))                                                
          )
        ),
        #
        # Set width of side panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Check which tab is selected
        #
        conditionalPanel(condition = "input.tabs3 == 31",
          #
          #
          #
          h4(textOutput("mainHeader3a"))
        ),
        #
        # Check which tab is selected
        #
        conditionalPanel(condition = "input.tabs3 != 31",
          #
          # Name of indicator on header
          #
          h4(textOutput("mainHeader3"))
        ),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs3",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 31,
                   withSpinner(plotOutput("ladder"), type = 5)), 
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 32,
                   withSpinner(leafletOutput("map.ladder", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 33,
                   DT::dataTableOutput("table.ladder"))                   
        ),
      #
      # Set width of main panel
      #
      width = 9)
    )
  ),
  #
  # Other water indicators
  #
  tabPanel(title = "Water", value = 4, icon = icon(name = "tint", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader4")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Menu when 'Water' menu tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 4",
          #
          # Select Country
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country4", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select City
          #
          div(style="display: inline-block;vertical-align:middle;",          
              selectInput(inputId = "city4",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;", 
              actionLink(inputId = "info4", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Select indicator
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
          # Menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs4 == 41",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info41", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.water", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            # Select secondary stratification
            #
            selectInput(inputId = "y.water", 
                        label = "Select secondary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"),
                        selected = "type")),
          #
          # Menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs4 == 42",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info42", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.water", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method chosen
            #
            uiOutput("map.bins.water.control"),
            #
            # Quantiles slider when 'quantile' method chosen
            #
            uiOutput("map.quantile.water.control")            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs4 == 43",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info43", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.water.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.water.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))                                                
          )
        ),            
        #
        # Set width of side panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Name of indicator on header
        #
        h4(textOutput("mainHeader4")),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs4",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 41,
                   withSpinner(plotOutput("water"), type = 5)), 
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 42,
                   withSpinner(leafletOutput("map.water", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 43,
                   DT::dataTableOutput("table.water"))                   
        ),
      #
      # Set width of main panel
      #
      width = 9)
      )
    ),
  #
  # Other sanitation indicators
  #
  tabPanel(title = "Sanitation", value = 5, icon = icon(name = "user", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader5")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Menu when 'Sanitation' menu tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 5",
          #
          # Select Country
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country5", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select City
          #
          div(style="display: inline-block;vertical-align:middle;",          
              selectInput(inputId = "city5",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;", 
              actionLink(inputId = "info5", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Select indicator
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
          # Menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs5 == 51",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info51", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.sanitation", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            # Select secondary stratification
            #
            selectInput(inputId = "y.sanitation", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          # Menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs5 == 52",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info52", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.sanitation", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method chosen
            #
            uiOutput("map.bins.sanitation.control"),
            #
            # Quantiles slider when 'quantile' method chosen
            #
            uiOutput("map.quantile.sanitation.control")            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs5 == 53",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info53", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.sanitation.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.sanitation.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))                                                
          )
        ),             
        #
        # Set width of side panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Name of indicator on header
        #
        h4(textOutput("mainHeader5")),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs5",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 51,
                   withSpinner(plotOutput("sanitation"), type = 5)), 
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 52,
                   withSpinner(leafletOutput("map.sanitation", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 53,
                   DT::dataTableOutput("table.sanitation"))                   
        ),
      #
      # Set width of main panel
      #
      width = 9)
      )
    ),
  #
  # Hygiene indicators menu
  #
  tabPanel(title = "Hygiene", value = 6, icon = icon(name = "signing", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader6")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Menu when 'Hygiene' menu tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 6",
          #
          # Select Country
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country6", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select City
          #
          div(style="display: inline-block;vertical-align:middle;",          
              selectInput(inputId = "city6",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;", 
              actionLink(inputId = "info6", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Select indicator
          #
          selectInput(inputId = "z.hygiene", 
                      label = "Select Indicator Set", 
                      choices = list("Adequate menstrual hygiene materials" = "san28",
                                     "Good menstrual hygiene behaviour" = "jmpWomenHygiene",
                                     "Use of sanitation facility during menstruation" = "jmpWoman"),
                      selected = "san28"),
          #
          # Menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs6 == 61",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info61", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.hygiene", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #
            # Select secondary stratification
            #
            selectInput(inputId = "y.hygiene", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          # Menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs6 == 62",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info52", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.hygiene", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method chosen
            #
            uiOutput("map.bins.hygiene.control"),
            #
            # Quantiles slider when 'quantile' method chosen
            #
            uiOutput("map.quantile.hygiene.control")            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs6 == 63",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Table specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info63", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.hygiene.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.hygiene.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))                                                
          )
        ),             
        #
        # Set width of side panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        # Name of indicator on header
        #
        h4(textOutput("mainHeader6")),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs6",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 61,
                   withSpinner(plotOutput("hygiene"), type = 5)),
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 62,
                   withSpinner(leafletOutput("map.hygiene", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 63,
                   DT::dataTableOutput("table.hygiene"))                   
        ),
      #
      # Set width of main panel
      #
      width = 9)
    )
  ),
  #
  # Overall indicators menu
  #
  tabPanel(title = "Overall", value = 7, icon = icon(name = "globe", class = "fa-lg"),
    #
    # Sidebar layout
    #
    sidebarLayout(
      #
      # Create sidebar panel
      #
      sidebarPanel(
        #
        # Name of city and country
        #
        h3(textOutput("sideHeader7")),
        #
        # Add horizontal divider
        #
        hr(),
        #
        # Menu when 'Overall' menu tab selected
        #
        conditionalPanel(condition = "input.chosenTab == 7",
          #
          # Select Country
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country7", 
                          label = "Country",
                          choices = unique(areaResultsLong$country),
                          width = "140px")), 
          #
          # Select City
          #
          div(style="display: inline-block;vertical-align:middle;",          
              selectInput(inputId = "city7",
                          label = "City",
                          choices = c(None = "."),
                          width = "140px")),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("Indicators")),
          #
          # Add 'Help' action link
          #
          div(style="display: inline-block;vertical-align:middle;", 
              actionLink(inputId = "info7", 
                         label = "",
                         icon = icon(name = "info-sign", lib = "glyphicon"))),        
          #
          # Select indicator set
          #
          selectInput(inputId = "z.overall", 
                      label = "Select Indicator Set", 
                      choices = list("Overall" = "overallSet1")),
          #
          # Menu when 'Charts' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs7 == 71",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info71", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select primary stratification
            #
            selectInput(inputId = "x.overall", 
                        label = "Select primary stratification", 
                        choices = list("Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth")),
            #  
            # Select secondary stratification
            #                         
            selectInput(inputId = "y.overall", 
                        label = "Select secondary stratification", 
                        choices = list(None = ".", 
                                       "Survey Area" = "surveyArea", 
                                       "Area Type" = "type", 
                                       "Wealth Quintile" = "wealth"))),
          #
          # Menu when 'Charts' sub-tab not selected
          #
          conditionalPanel(condition = "input.tabs7 != 71",
            #
            # Select indicator
            #
            selectInput(inputId = "indicator.overall",
                        label = "Select indicator",
                        choices = list("No access to adequate services" = "overall4",
                                       "Adequate sanitation only" = "overall3",
                                       "Adequate water only" = "overall2",
                                       "Adequate water and sanitation" = "overall1"))
          ),          
          #
          # Menu when 'Maps' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs7 == 72",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Map specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info72", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select map colour scheme
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
            # Select mapping colour method
            #
            selectInput(inputId = "map.colour.overall", 
                        label = "Select colour mapping method", 
                        choices = list("Linear" = "linear", 
                                       "Equal Interval" = "interval", 
                                       "Quantile" = "quantile"),
                        selected = "interval"),
            #
            # Bins slider when 'interval' method selected
            #
            uiOutput("map.bins.overall.control"),
            #
            # Quantiles slider when 'quantile' method selected
            #
            uiOutput("map.quantile.overall.control")            
          ),
          #
          # Add menu when 'Tables' sub-tab selected
          #
          conditionalPanel(condition = "input.tabs7 == 73",
            #
            # Sub-heading
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Chart specifications")),
            #
            # Add 'Help' action link
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info73", 
                           label = "",
                           icon = icon(name = "question-sign", lib = "glyphicon"))),
            #
            # Select survey area filter
            #
            selectInput(inputId = "table.overall.area",
                        label = "Survey Area",
                        choices = c("All", as.character(unique(areaResultsLong$strata)))),
            #
            # Select area type filter
            #
            selectInput(inputId = "table.overall.type",
                        label = "Slum/Citywide",
                        choices = c("All", as.character(unique(areaResultsLong$type))))                                                
          )
        ),             
        #
        # Set width of main panel
        #
        width = 3),
      #
      # Set main panel contents
      #
      mainPanel(
        #
        #
        #
        conditionalPanel(condition = "input.tabs7 == 71",
          #
          #
          #
          h4("Overall access to services")
        ),
        #
        #
        #
        conditionalPanel(condition = "input.tabs7 != 71",
          #
          # Name of indicator on header
          #
          h4(textOutput("mainHeader7"))
        ),
        #
        # Create sub-tabs panel
        #
        tabsetPanel(type = "tabs", id = "tabs7",
          #
          # Create 'Charts' sub-tab
          #
          tabPanel(title = "Charts", value = 71,
                   withSpinner(plotOutput("overall"), type = 5)),
          #
          # Create 'Maps' sub-tab
          #
          tabPanel(title = "Maps", value = 72,
                   withSpinner(leafletOutput("map.overall", width = "100%", height = 500), type = 5)),
          #
          # Create 'Tables' sub-tab
          #
          tabPanel(title = "Tables", value = 73,
                   DT::dataTableOutput("table.overall"))                   
        ),
      #
      # Set width of main panel
      #
      width = 9)
    )
  ),
  #
  # Create Functions tab
  #
  navbarMenu(title = "Tools", icon = icon(name = "wrench", class = "fa-lg"),
    #
    # Sample size calculator tab
    #
    tabPanel(title = "Sample Size Calculator", value = "tabs8", icon = icon(name = "calculator", class = "fa-lg"),
      #
      # Sidebar layout
      #
      sidebarLayout(
        #
        # Create sidebar panel
        #
        sidebarPanel(
          #
          # Include shinyjs
          #
          shinyjs::useShinyjs(),
          #
          # Specify ID for sidebar panel
          #
          id = "sample-size",
          #
          # Sub-header
          #
          h3("Sample size calculator"),
          #
          # Add whitespace
          #
          br(),
          #
          # Add sub-sub-header
          #
          h4("Calculate sample size"),          
          #
          # Select z-value for CI
          #
          selectInput(inputId = "z.ci",
                      label = "Select z-value ( z )",
                      choices = list("96% CI ( z-value: 2.05 )" = "2.05",
                                     "95% CI ( z-value: 1.96 )" = "1.96",
                                     "92% CI ( z-value: 1.75 )" = "1.75",
                                     "90% CI ( z-value: 1.645 )" = "1.645"),
                      selected = "1.96"),
          #
          # Select expected proportion/prevalence
          #
          sliderInput(inputId = "proportion",
                      label = "Indicator proportion/prevalence ( p )",
                      min = 0, max = 100, value = 50, step = 1),
          #
          # Select level of precision
          # 
          sliderInput(inputId = "precision",
                      label = "Select level of precision ( c )",
                      min = 3, max = 10, value = 5),
          #
          # Select survey sample type
          #
          radioButtons(inputId = "surveyType",
                       label = "Survey design",
                       choices = list("Simple random sample" = "srs",
                                      "Cluster sample" = "cluster"),
                       inline = TRUE,
                       selected = "srs"),
          #
          # Action buttons available when surveyType == 'srs'
          #
          conditionalPanel(condition = "input.surveyType == 'srs'",
            #
            # Action button
            #
            actionButton(inputId = "calculate1",
                         label = "Calculate",
                         class = "btn-primary",
                         icon = icon(name = "calculator", class = "fa-lg")),
            #
            # Action button - Reset
            #
            actionButton(inputId = "reset1",
                         label = "Reset",
                         class = "btn-primary",
                         icon = icon(name = "refresh", class = "fa-lg"))
          ),
          #
          # Add whitespace
          #
          br(),
          #
          # Header for sample size calculation results
          #
          h4(textOutput("sample.header")),
          #
          # Add table of sample size calculation results
          #
          tableOutput("sample"),
          #
          # Add whitespace
          #
          hr(),
          #
          # Show if survey design is cluster
          #
          conditionalPanel(condition = "input.surveyType == 'cluster'",
            #
            # Header for design effect and ICC calculator
            #
            h4("Calculate design effect and ICC"),
            #
            # Upload dataset for DEFF calculation
            #
            fileInput(inputId = "file1",
                      label = "Upload dataset CSV file for DEFF calculation",
                      accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
            #
            # Select variable name for indicator to test 
            #
            selectInput(inputId = "variable",
                        label = "Select variable name of indicator to test",
                        choices = c("Select variable name" = "")),
            #
            # Select variable name for survey cluster 
            #
            selectInput(inputId = "cluster",
                        label = "Select variable name of survey cluster",
                        choices = c("Select variable name" = "")),
            #
            #
            #
            sliderInput(inputId = "cluster.size",
                        label = "Number of samples per cluster planned for survey",
                        min = 0, max = 30, step = 1, value = 10), 
            #
            # Action button - Calculate
            #
            actionButton(inputId = "calculate2",
                         label = "Calculate",
                         class = "btn-primary",
                         icon = icon(name = "calculator", class = "fa-lg")),
            #
            # Action button - Reset
            #
            actionButton(inputId = "reset2",
                         label = "Reset",
                         class = "btn-primary",
                         icon = icon(name = "refresh", class = "fa-lg")),
            #
            # Add whitespace
            #
            hr(), br(),
            #
            # Header for DEFF and ICC calculation results
            #
            h4(textOutput("deff.header")),
            #
            # Add table of DEFF and ICC calculation results
            #
            tableOutput("deff")         
          ),  
        #
        # Set width of sidebar panel
        #
        width = 5
        ),
        #
        # Add contents to main panel
        #
        mainPanel(withMathJax(),
          #
          # Add text on sample size calculations
          #
          HTML("
            <h4>Sample size for estimating proportions</h4>
            <p>Sample size is estimated using the following formula:</p>          
            $$ n \\ = \\ z ^ 2 \\times \\frac{p \\ (1 \\ - \\ p)}{c ^ 2} $$
            $$ \\begin{align}
            \\text{where} \\\\
            n \\ &= \\ \\text{sample size} \\\\
            z \\ &= \\ \\text{z-value for preferred confidence interval} \\\\
            p \\ &= \\ \\text{expected indicator proportion / prevalence} \\\\
            c \\ &= \\ \\text{level of precision}
            \\end{align} $$
            <p>The appropriate or desired values for the <code><strong>z</strong></code>, <code><strong>p</strong></code>, and <code><strong>c</strong></code> parameters can be set on the right sidebar panel.<p>
            <ul>
              <li><code><strong><em>z</em></strong></code> - a <code>95% CI</code> is the default choice which has a corresponding <code>z-value</code> of <code>1.96</code>.
              <li><code><strong><em>p</em></strong></code> - proportion or prevalence estimate of the indicator of interest based on previous survey data. The default value is set at <code>50%</code> as this is the indicator proportion or prevalence that will require the most sample size.
              <li><code><strong><em>c</em></strong></code> - a precision of <code>±5%</code> is set as default as most prevalence surveys, specifically those for diseases, require this level of precision. Coverage surveys on the other hand would need at least <code>±10%</code>.
            </ul>
            <p>This formula is used to estimate sample size for a <code>simple random sample (SRS)</code> survey.</p>
            <br>
            <h4>Sample size for cluster sample surveys</h4>
            <p>A <code>SRS</code> survey design is often not the most practical and cost-efficient sampling design to use for a survey. Most surveys, instead, use a <code>cluster sample</code> design wherein the primary sampling unit is a cluster (i.e., a village or a community) from where the individual or household samples are to be drawn. The sample size estimation for this type of surveys takes into account the loss of variance due to the clustered nature of the sample (i.e., samples drawn from the same cluster would tend to be similar to each other) as shown in the following formula:</p>
            $$ n \\ = \\ z ^ 2 \\times \\frac{p \\ (1 \\ - \\ p)}{c ^ 2} \\ \\times \\ DEFF $$            
            <p>where a factor called <code>DEFF</code> or <code>design effect</code> is used to inflate the sample size of a <code>SRS</code> to mitigate loss of variance due to the <code>cluster sample</code> design. <code>DEFF</code> is estimated using the following formula:</p>
            $$ DEFF \\ = \\ 1 \\ + \\ (c \\ - \\ 1) \\ \\times \\ \\rho $$
            $$ \\begin{align}
            \\text{where} \\\\
            c \\ &= \\ \\text{cluster size} \\\\
            \\rho \\ &= \\text{intracluster correlation coefficient (ICC)}
            \\end{align} $$
            <p>As can be noted from the formula, <code><em>DEFF</em></code> is dependent on two factors: <code>cluster size</code> and <code>ICC</code> or \\(\\rho\\). <code>Cluster size</code> will be the number of samples per cluster planned for the survey. <code>ICC</code> or \\(\\rho\\), on the other hand, can be estimated using data from previous cluster surveys using the calculator on right sidebar panel. This calculator allows the user to provide appropriate cluster survey data <em>(see sidebar panel)</em> that can be used to perform this calculation. It should be noted that <code>DEFF</code> and <code>ICC</code> or \\(\\rho\\) estimation is indicator-specific. Therefore, the cluster survey data provided for <code>DEFF</code> and <code>ICC</code> or \\(\\rho\\) calculations should contain data for the indicator of interest and data identifying the clusters of the survey.  If no cluster survey data is provided, a conservative assumption is made and a \\(DEFF = 5\\) is used.</p>
            <br/>
            "),
        #
        # Set width of main panel
        #
        width = 7) 
      )
    ),
    #
    # Create spatial sampling tab
    #
    tabPanel(title = "Spatial Sampling", id = "tabs9", icon = icon(name = "map", class = "fa-lg"),
      #
      # Set sidebar layout
      #
      sidebarLayout(
        #
        # Add sidebar panel
        #
        sidebarPanel(
          #
          # Include shinyjs
          #
          shinyjs::useShinyjs(),
          #
          # Specify ID for sidebar panel
          #
          id = "spatial-sample",
          #
          # Sub-header
          #  
          h3("Spatial Sampling"),
          #
          # Add whitespace
          #
          br(),
          #
          # Sub-sub-header
          #
          div(style="display: inline-block;vertical-align:middle;", h4("City map data input")),
          #
          # Action link 'Info' for uploading survey area map
          #
          div(style="display: inline-block;vertical-align:middle;",
              actionLink(inputId = "info91",
                          label = "",
                          icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          # Upload shapefile
          #
          fileInput(inputId = "shp1",
                    label = "Upload map of citywide survey area",
                    accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
                    multiple = TRUE),
          #
          #
          #
          div(style="display: inline-block;vertical-align:top;", uiOutput("map.draw.control1")),
          #
          #
          #
          conditionalPanel(condition = "input.mapDraw1",
            #
            # Add whitespace
            #
            br(),
            #
            #
            #
            selectInput(inputId = "var.city.area",
                        label = "Select map data identifier for city survey areas",
                        choices = list(None = ".")),
            #
            #
            #
            selectInput(inputId = "city.area.name",
                        label = "Select city survey area to sample",
                        choices = list(None = ".")),
            #
            #
            #
            numericInput(inputId = "n.psu.citywide",
                         label = "Number of PSU/clusers to sample",
                         min = 16, max = 60, step = 1, value = 30),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionButton(inputId = "sample.city",
                             label = "Sample",
                             class = "btn-primary",
                             icon = icon(name = "th", clas = "fa-lg"))),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                uiOutput("download.city"))                         
            ),
            #
            #
            #
            br(), br(),
            #
            # Sub-sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", h4("Slum map data input")),
            #
            # Action link 'Info' for uploading survey area map
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info92",
                            label = "",
                            icon = icon(name = "info-sign", lib = "glyphicon"))),          
            #
            #
            #
            radioButtons(inputId = "slumInfo",
                         label = "Available slum area sampling information",
                         choices = list("Slum maps" = "slum.map",
                                        "Slum lists" = "slum.list"),
                         inline = TRUE,
                         selected = "."),
          #
          #
          #
          conditionalPanel(condition = "input.slumInfo == 'slum.map'",
            #
            #
            #
            fileInput(inputId = "shp2",
                      label = "Upload map of slums in survey area",
                      accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
                      multiple = TRUE),
          #
          #
          #
          div(style="display: inline-block;vertical-align:top;", uiOutput("map.draw.control2"))                     
          ),
          #
          #
          #
          conditionalPanel(condition = "input.mapDraw2",
            #
            # Add whitespace
            #
            br(),
            #
            #
            #
            selectInput(inputId = "var.slum.area1",
                        label = "Select map data identifier for slum survey areas",
                        choices = list(None = ".")),
            #
            #
            #
            selectInput(inputId = "slum.area.name1",
                        label = "Select slum survey area to sample",
                        choices = list(None = ".")),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionButton(inputId = "sample.slum1",
                             label = "Sample",
                             class = "btn-primary",
                             icon = icon(name = "th", clas = "fa-lg"))),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                uiOutput("download.slum1"))
          ),            
          #
          #
          #
          conditionalPanel(condition = "input.slumInfo == 'slum.list'",
            #
            # 
            #
            fileInput(inputId = "list1",
                      label = "Upload list of slum areas",
                      accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
            #
            #
            #
            selectInput(inputId = "var.slum.area2",
                        label = "Select map data identifier for slum survey areas",
                        choices = list(None = ".")),
            #
            #
            #
            selectInput(inputId = "slum.area.name2",
                        label = "Select slum survey area to sample",
                        choices = list(None = ".")),
            #
            #
            #
            numericInput(inputId = "n.psu.slum",
                         label = "Number of PSU/clusers to sample",
                         min = 16, max = 60, step = 1, value = 30),         
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionButton(inputId = "sample.slum2",
                             label = "Sample",
                             class = "btn-primary",
                             icon = icon(name = "th", clas = "fa-lg"))),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                uiOutput("download.slum2"))
        ),
        #
        #
        #
        width = 3
        ),
        #
        #
        #
        mainPanel(
          #
          #
          #
          tabsetPanel(type = "tabs", id = "tabs9",
            #
            #
            #
            tabPanel(title = "Sampling Maps", value = 91,
              #
              # Render leaflet map
              #
              withSpinner(leafletOutput("map.sampling", width = "100%", height = 500), type = 5)
            ),
            #
            #
            #
            tabPanel(title = "City Map Sampling Lists", value = 92,
              #
              #
              #
              conditionalPanel(condition = "input['city.area.name'] == '.'",
                #
                #
                #
                br(), br(),
                #
                #
                #
                actionButton(inputId = "warning1",
                             label = "List not available. Click for more info.",
                             class = "btn-warning",
                             icon = icon(name = "exclamation-triangle", class = "fa-lg"))
              ),
              #
              # Render table
              #
              DT::dataTableOutput("city.grid.table")
            ),
            #
            #
            #
            tabPanel(title = "Slum Map Sampling Lists", value = 93,
              #
              #
              #
              conditionalPanel(condition = "input['slum.area.name1'] == '.'",
                #
                #
                #
                br(), br(),
                #
                #
                #
                actionButton(inputId = "warning2",
                             label = "List not available. Click for more info.",
                             class = "btn-warning",
                             icon = icon(name = "exclamation-triangle", class = "fa-lg"))
              ),
              #
              # Render table
              #
              DT::dataTableOutput("slum.grid.table")
            ),
            #
            #
            #
            tabPanel(title = "Slum Lists", value = 94,
              #
              #
              #
              conditionalPanel(condition = "input['slum.area.name2'] == '.'",
                #
                #
                #
                br(), br(),
                #
                #
                #
                actionButton(inputId = "warning3",
                             label = "List not available. Click for more info.",
                             class = "btn-warning",
                             icon = icon(name = "exclamation-triangle", class = "fa-lg"))
              ),
              #
              # Render table
              #
              DT::dataTableOutput("sample.slum.table")              
            )
          ), 
          #
          #
          #
          width = 9
        )
      )        
    )
  )
)