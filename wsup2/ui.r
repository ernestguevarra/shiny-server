################################################################################
#
# UI
#
################################################################################
#
# Set navbar
#
navbarPage(title = "Urban Water and Sanitation Survey", id = "chosenTab",
  #
  # Create tab panel
  #
  tabPanel(title = "", 
           value = 1, 
           icon = icon(name = "home", class = "fa-lg"),
    #
    # Header HTML
    #       
    div(class = "outer",
      #
      # Header HTML
      #
      tags$head(
        includeCSS("styles.css"),
        tags$link(rel = "icon", href = "http://www.validmeasures.org/favicon.ico")
      ),
      #
      # Output map
      #
      leafletOutput("map", width = "100%", height = "100%"),
      #
      # Create absolute panel - INPUT
      # 
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
        draggable = TRUE, top = 65, left = "auto", right = 10, bottom = "auto",
        width = 330, height = "auto",
        #
        #
        #
        shinyjs::useShinyjs(),
        #
        #
        #
        radioButtons(inputId = "radio.controls",
          label = "",
          choices = c("Chart controls" = "chart",
                      "Map controls" = "map"),
          inline = TRUE),
        #
        #
        #
        conditionalPanel(condition = "input['radio.controls'] == 'chart'",
          #
          # Panel section header
          #
		  div(style="display: inline-block;vertical-align:middle;",        
              h4("Chart Options")
          ),
		  #
		  # Add 'Help' action link
		  #
		  div(style="display: inline-block;vertical-align:middle;",
			  actionLink(inputId = "info1", 
					     label = "",
					     icon = icon(name = "info-sign", lib = "glyphicon"))),
          #
          #
          #
          br(),					   
          #
          # Select country survey
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "country", 
                label = "Country",
                choices = list(None = "."), 
                width = "140px")
          ),
          #
          # Select city survey
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "city", 
                label = "City",
                choices = list(None = "."),
                width = "140px")
          ),
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",        
              selectInput(inputId = "start.year",
                label = "From",
                choices = list(All = "."),
                selected = ".",
                width = "140px")
          ),
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",        
              selectInput(inputId = "end.year",
                label = "To",
                choices = list(All = "."),
                selected = ".",
                width = "140px")
          ),
          #
          #
          #
	      selectInput(inputId = "varSet",
		    label = "Select indicator set",
		    choices = list(None = ".")),
          #
          #
          #
          selectInput(inputId = "varList",
            label = "Select indicator",
            choices = list(None = ".")),
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",
              selectInput(inputId = "group.by",
                label = "Disaggregate by",
                choices = list(None = ".",
                               "Survey Area" = "surveyArea",
                               "Wealth Quintile" = "wealth"),
                selected = ".",
                width = "140px")
          ),        
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",        
              selectInput(inputId = "facet.by",
                label = "Stratify by",
                choices = list(None = ".",
                               "Area Type" = "type"),
                selected = ".",
                width = "140px")
          ),
          #
          #
          #
          uiOutput("error.bar")
          #
          #
          #
          #actionButton(inputId = "refresh.chart.settings",
          #             label = "Reset",
          #             icon = icon(name = "refresh", class = "fa-lg"))
        ),
        #
        #
        #
        conditionalPanel(condition = "input['radio.controls'] == 'map'",
          #
          #
          #
		  div(style="display: inline-block;vertical-align:middle;",        
              h4("Map Options")
          ),
		  #
		  # Add 'Help' action link
		  #
		  div(style="display: inline-block;vertical-align:middle;",
			  actionLink(inputId = "info2", 
					     label = "",
					     icon = icon(name = "info-sign", lib = "glyphicon"))),
		  #
		  #
		  #
		  br(),
		  #
		  # Select map colour scheme
		  #
          div(style="display: inline-block;vertical-align:middle;",		
		      selectInput(inputId = "map.palette",
		   	    label = "Colour palette",
				choices = list("Sequential" = c("Blues" = "Blues",
				      						    "BuGn" = "BuGn",
												"BuPu" = "BuPu",
												"GnBu" = "GnBu",
												"Greens" = "Greens",
												"Greys" = "Greys",
												"Oranges" = "Oranges",
												"OrRd" = "OrRd",
												"Purples" = "Purples",
												"PuBu" = "PuBu",
												"PuBuGn" = "PuBuGn",
												"PuRd" = "PuRd",
												"Reds" = "Reds",
												"YlGn" = "YlGn",
												"YlGnBu" = "YlGnBu",
												"YlOrBr" = "YlOrBr",
												"YlOrRd" = "YlOrRd"),
							    "Divergent" = c("BrBuGn" = "BrBG",
												"PiYlGn" = "PiYG",
												"PuRdGn" = "PRGn",
												"PuOr" = "PuOr",
												"RdBu" = "RdBu",
												"RdGy" = "RdGy",
												"RdYlBu" = "RdYlBu",
												"RdYlGn" = "RdYlGn",
												"Spectral" = "Spectral")),
				selected = "YlGnBu",
				width = "140px")
		  ),
		  #
		  # Select mapping colour method
		  #
          div(style="display: inline-block;vertical-align:middle;",
		      selectInput(inputId = "map.colour", 
			    label = "Mapping method", 
				choices = list("Linear" = "linear", 
				               "Equal Interval" = "interval", 
							   "Quantile" = "quantile"),
				selected = "interval",
				width = "140px")
		  ),
	      #
	      #
	      #
          conditionalPanel(condition = "input['map.colour'] == 'interval'",
            #
            # Create slider input control
            #
            sliderInput(inputId = "map.bins",
                        label = "Number of classes",
                        min = 3, max = 7, value = 5, step = 1)
          ),
          #
          #
          #
          conditionalPanel(condition = "input['map.colour'] == 'quantile'",
            #
            # Create slider input control
            #
            sliderInput(inputId = "map.quantiles",
                        label = "Number of quantiles",
                        min = 3, max = 7, value = 5, step = 1)      
          )
          #
          #
          #
          #actionButton(inputId = "refresh.map.settings",
          #             label = "Reset",
          #             icon = icon(name = "refresh", class = "fa-lg"))          
        )
      ), 
      #
      #
      #
      conditionalPanel(condition = "input.varSet == 'waterSet1' | input.varSet == 'sanSet1' | input.varSet == 'handSet' | input.varSet == 'overallSet1' | input.varList != '.'",
        #
        # Create absolute panel - OUTPUT
        # 
        absolutePanel(id = "plots", class = "panel panel-default", fixed = TRUE,
          draggable = FALSE, top = "auto", right = "auto", left = 10, bottom = 10,
          width = 500, height = 470,
          #
          # Panel section header
          #
          h3(textOutput("panel.header")),
          h5(textOutput("indicator.header")),
          h5(textOutput("year.header")),
          #
          #
          #
          plotOutput("bar.plot")
        )
      ),
      #
      # Create footer citation
      #
      tags$div(id = "cite",
        "Survey design and analysis by ", 
        tags$a(href = 'http://www.validinternational.org/', 
        'Valid International'), 
        "| Survey data collected by ", 
        tags$a(href = 'http://www.wsup.com', 
        'Water and Sanitation for the Urban Poor')
      )
    )
  ),
  #
  #
  #
  navbarMenu(title = "Tools",
             icon = icon(name = "wrench", class = "fa-lg"),
    #
    # Sample size calculator tab
    #
    tabPanel(title = "Sample Size Calculator", value = "tabs21", icon = icon(name = "calculator", class = "fa-lg"),
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
          # Select survey sample type
          #
          radioButtons(inputId = "surveyType",
                       label = "",
                       choices = list("Simple random sample" = "srs",
                                      "Cluster sample" = "cluster"),
                       inline = TRUE,
                       selected = "srs"),
          #
          # Action buttons available when surveyType == 'srs'
          #
          conditionalPanel(condition = "input.surveyType == 'srs'",
            #
            #
            #
            hr(),
            #
            # Add sub-sub-header
            #
            h4("Calculate sample size for a simple random sample survey"),          
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
                        label = "Proportion/prevalence ( p )",
                        min = 0, max = 100, value = 50, step = 1),
            #
            # Select level of precision
            #
            sliderInput(inputId = "precision",
                        label = "Level of precision ( c )",
                        min = 3, max = 10, value = 5),
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
                         icon = icon(name = "refresh", class = "fa-lg")),
          #
          # Add whitespace
          #
          br(), hr(),
          #
          # Header for sample size calculation results
          #
          h4(textOutput("sample.header")),
          #
          # Add table of sample size calculation results
          #
          tableOutput("sample")
          ),
          #
          # Show if survey design is cluster
          #
          conditionalPanel(condition = "input.surveyType == 'cluster'",
            #
            # Add whitespace and horizontal bar
            #
            hr(),
            #
            # Add sub-sub-header
            #
            h4("Calculate sample size for a cluster sample survey"),          
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
                        label = "Proportion/prevalence ( p )",
                        min = 0, max = 100, value = 50, step = 1),
            #
            # Select level of precision
            #
            sliderInput(inputId = "precision",
                        label = "Level of precision ( c )",
                        min = 3, max = 10, value = 5),
            #
            #
            #
            hr(),
            #
            # Header for design effect and ICC calculator
            #
            h5("Calculate design effect and ICC"),
            #
            # Upload dataset for DEFF calculation
            #
            fileInput(inputId = "file2",
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
            br(), hr(),
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
        #
        #
        br(),
        #
        #
        #
        #h6("Sample size calculator app designed and developed by ",
        #   tags$a(href = 'http://www.validinternational.org/', 'Valid International')),
        #
        # Create footer citation
        #
        #tags$div(id = "cite",
        #  "Survey design and analysis by ", 
        #  tags$a(href = 'http://www.validinternational.org/', 
        #  'Valid International'), 
        #  "| Survey data collected by ", 
        #  tags$a(href = 'http://www.wsup.com', 
        #  'Water and Sanitation for the Urban Poor')
        #),
        #
        # Set width of sidebar panel
        #
        width = 4
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
        width = 8) 
      )
    ),
    #
    # Create spatial sampling tab
    #
    tabPanel(title = "Spatial Sampling", id = "tabs22", icon = icon(name = "map", class = "fa-lg"),
      #
      # Header HTML
      #       
      div(class = "outer",
        #
        # Header HTML
        #
        tags$head(
          includeCSS("styles.css"),
          tags$link(rel = "icon", href = "http://www.validmeasures.org/favicon.ico")
        ),
        #
        # Render leaflet map
        #
        leafletOutput("map.sampling", width = "100%", height = "100%"),
        #
        #
        #
        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
          draggable = TRUE, top = 65, left = "auto", right = 10, bottom = "auto",
          width = 330, height = "auto",
          #
          # Include shinyjs
          #
          shinyjs::useShinyjs(),
          #
          #
          #
          h4("Spatial Sampling"),
          #
          #
          #
          radioButtons(inputId = "map.controls",
            label = "",
            inline = TRUE,
            choices = c("Citywide Sample" = "city",
                        "Slum Sample" = "slum"),
            selected = "city"),
          #
          #
          #
          conditionalPanel(condition = "input['map.controls'] == 'city'",
            #
            # Sub-sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", 
                h5("City map data input")),
            #
            # Action link 'Info' for uploading survey area map
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info3",
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
            div(style="display: inline-block;vertical-align:top;", 
                uiOutput("map.draw.control1")),
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
                               icon = icon(name = "th", clas = "fa-lg")))
            )
          ),
          #
          #
          #
          conditionalPanel(condition = "input['map.controls'] == 'slum'",            
            #
            # Sub-sub-header
            #
            div(style="display: inline-block;vertical-align:middle;", 
                  h5("Slum map data input")),
            #
            # Action link 'Info' for uploading survey area map
            #
            div(style="display: inline-block;vertical-align:middle;",
                actionLink(inputId = "info4",
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
              div(style="display: inline-block;vertical-align:top;", 
                  uiOutput("map.draw.control2")),
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
                                 icon = icon(name = "th", clas = "fa-lg")))
              )
            ),            
            #
            #
            #
            conditionalPanel(condition = "input.slumInfo == 'slum.list'",
              #
              #
              #
              hr(),
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
                             icon = icon(name = "th", clas = "fa-lg")))
            )
          ),
          #
          #
          #
          conditionalPanel(condition = "input['sample.city']",
            #
            # Create absolute panel - tables
            # 
            absolutePanel(id = "tables", class = "panel panel-default", fixed = TRUE,
              draggable = TRUE, top = "auto", right = "auto", left = 10, bottom = 10,
              width = "auto", height = "auto",
              #
              #
              #
              div(style="display: inline-block;vertical-align:middle;",
                  h4(textOutput("city.table.header"))
              ),
              #
              #
              #
              div(style="display: inline-block;vertical-align:middle;",
                  uiOutput("download.city")                         
              ),
              #
              #
              #
              hr(),
              #
              # Render table
              #
              DT::dataTableOutput("city.grid.table")
            )
          ),
          #
          #
          #
          conditionalPanel(condition = "input['sample.slum1']",
            #
            # Create absolute panel - tables
            # 
            absolutePanel(id = "tables", class = "panel panel-default", fixed = TRUE,
              draggable = TRUE, top = "auto", right = "auto", left = 10, bottom = 10,
              width = "auto", height = "auto",
              #
              #
              #
              h4(textOutput("slum1.table.header")),
              #
              #
              #
              div(style="display: inline-block;vertical-align:middle;",
                  uiOutput("download.slum1")                         
              ),              
              #
              #
              #
              hr(),
              #
              # Render table
              #
              DT::dataTableOutput("slum.grid.table")
            )
          ),
          #
          #
          #
          conditionalPanel(condition = "input['sample.slum2']",
            #
            # Create absolute panel - tables
            # 
            absolutePanel(id = "tables", class = "panel panel-default", fixed = TRUE,
              draggable = TRUE, top = "auto", right = "auto", left = 10, bottom = 10,
              width = "auto", height = "auto",
              #
              #
              #
              h4(textOutput("slum2.table.header")),
              #
              #
              #
              div(style="display: inline-block;vertical-align:middle;",
                  uiOutput("download.slum2")                         
              ),              
              #
              #
              #
              hr(),
              #
              # Render table
              #
              DT::dataTableOutput("sample.slum.table")
            )
          )                   
        ),
        #
        # Create footer citation
        #
        tags$div(id = "citeReverse",
          "Spatial sampling app designed and developed by ", 
          tags$a(href = 'http://www.validinternational.org/', 
          'Valid International')
        )          
      )
    ),
    #
    #
    #
    tabPanel(title = "Statistical Tests", id = "tabs23", icon = icon(name = "line-chart", class = "fa-lg"),
      #
      #
      #
      sidebarLayout(
        #
        #
        #
        sidebarPanel(
          #
          # Include shinyjs
          #
          shinyjs::useShinyjs(),
          #
          #
          #
          id = "stats.test",
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",          
              #
              #
              #
              h4("Statistical Tests")
          ),
          #
          #
          #
          div(style="display: inline-block;vertical-align:middle;",
              #
              #
              #
              actionLink(inputId = "info5",
                label = "",
                icon = icon(name = "info-sign", lib = "glyphicon"))
          ),
          #
          #
          #
          fileInput(inputId = "stat.test.data",
                    label = "Upload dataset for testing",
                    accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")
          ),
          #
          #
          #
          selectInput(inputId = "country.corr",
                      label = "Subset data",
                      choices = c(Select = "."),
                      selected = "."),
          #
          #
          #
          selectInput(inputId = "select.stats",
                      label = "Select statistical test to perform",
                      choices = c(Select = ".",
                                  "Correlation testing" = "corr",
                                  "Variance testing" = "variance",
                                  "Odds ratio" = "odds",
                                  "Risk ratio" = "risk"),
                      selected = "."),
          #
          #
          #
          hr(),          
          #
          #
          #
          conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'corr'",
            #
            #
            # 
            div(style="display: inline-block;vertical-align:middle;",            
                #
                #
                #
                h5("Set correlation test parameters")
            ),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                #
                #
                #
                actionLink(inputId = "info6",
                           label = "",
                           icon = icon(name = "info-sign", lib = "glyphicon"))
            ),            
            #
            #
            #
            uiOutput("x.corr"),
            uiOutput("y.corr"),
            #
            #
            #
            selectInput(inputId = "z.corr",
                        label = "Type of correlation coefficient",
                        choices = c(Select = "",
                                    "Pearson's r" = "pearson",
                                    "Kendall's tau" = "kendall",
                                    "Spearman's rho" = "spearman"),
                        selected = ""),
            #
            #
            #
            hr()                        
          ),
          #
          #
          #
          conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'variance'",
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",            
                #
                #
                #
                h5("Set variance test parameters")
            ),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                #
                #
                #
                actionLink(inputId = "info7",
                           label = "",
                           icon = icon(name = "info-sign", lib = "glyphicon"))
            ),
            #
            #
            #
            uiOutput("x.var"),
            uiOutput("y.var"),
            #
            #
            #
            selectInput(inputId = "z.var",
                        label = "Type of variance testing",
                        choices = c(Select = "",
                                    "t-test" = "t.test",
                                    "Wilcoxon test" = "wilcox",
                                    "Kruskal-Wallis test" = "kruskal"),
                        selected = ""),                      
            #
            #
            #
            hr()                        
          ),
          #
          #
          #
          conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'odds'",
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",            
                #
                #
                #
                h5("Set odds ratio calculation parameters")
            ),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                #
                #
                #
                actionLink(inputId = "info8",
                           label = "",
                           icon = icon(name = "info-sign", lib = "glyphicon"))
            ),
            #
            #
            #
            uiOutput("x.odds"),
            uiOutput("y.odds"),
            #
            #
            #
            hr()                        
          ),
          #
          #
          #
          conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'risk'",
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",            
                #
                #
                #
                h5("Set risk ratio calculation parameters")
            ),
            #
            #
            #
            div(style="display: inline-block;vertical-align:middle;",
                #
                #
                #
                actionLink(inputId = "info9",
                           label = "",
                           icon = icon(name = "info-sign", lib = "glyphicon"))
            ),
            #
            #
            #
            uiOutput("x.risk"),
            uiOutput("y.risk"),
            #
            #
            #
            selectInput(inputId = "z.risk",
                        label = "Risk ratio calculation method",
                        choices = c(Select = "",
                                    "Wald" = "wald",
                                    "Small sample adjustment" = "small",
                                    "Bootstrap" = "boot"),
                        selected = ""),
            #
            #
            #
            hr()                        
          ),
          #
          #
          #
          actionButton(inputId = "refresh.stats",
                       label = "Reset",
                       class = "btn-primary",
                       icon = icon(name = "refresh", class = "fa-lg")),
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
          fluidPage(
            #
            #
            #
            fluidRow(
              #
              #
              #
              column(
                #
                #
                #
                wellPanel(
                  #
                  #
                  #
                  h4("Correlation Test"),
                  #
                  #
                  #
                  hr(),
                  #
                  #
                  #
                  h5(textOutput("corr.results.header")),
                  #
                  #
                  #
                  tableOutput("corr.results")
                ),
                #
                #
                #
                width = 4
              ),
              #
              #
              #
              column(
                #
                #
                #
                wellPanel(
                  #
                  #
                  #
                  h4("Variance Test"),
                  #
                  #
                  #
                  hr(),
                  #
                  #
                  #
                  conditionalPanel(condition = "input['z.var'] == 't.test'",
                    #
                    #
                    #
                    h5(textOutput("var.results.t.header")),
                    #
                    #
                    #
                    tableOutput("var.results.t")
                  ),
                  #
                  #
                  #
                  conditionalPanel(condition = "input['z.var'] == 'wilcox'",
                    #
                    #
                    #
                    h5(textOutput("var.results.wilcox.header")),
                    #
                    #
                    #
                    tableOutput("var.results.wilcox")
                  ),
                  #
                  #
                  #
                  conditionalPanel(condition = "input['z.var'] == 'kruskal'",
                    #
                    #
                    #
                    h5(textOutput("var.results.kruskal.header")),
                    #
                    #
                    #
                    tableOutput("var.results.kruskal")
                  )
                ),
                #
                #
                #
                width = 4
              )              
            ),
            #
            #
            #
            fluidRow(hr()),
            #
            #
            #
            fluidRow(
              #
              #
              #
              column(
                #
                #
                #
                wellPanel(
                  #
                  #
                  #
                  h4("Odds ratio"),
                  #
                  #
                  #
                  hr(),
                  #
                  #
                  #
                  conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'odds' & input['x.odds'] != '' & input['y.odds'] != ''",
                    #
                    #
                    #
                    h5("Two by Two Table")
                  ),
                  #
                  #
                  #
                  tableOutput("odds.table"),
                  #
                  #
                  #
                  br(),
                  #
                  #
                  #
                  h5(textOutput("odds.results.header")),
                  #
                  #
                  #
                  tableOutput("odds.results")
                ),
                #
                #
                #
                width = 4
              ),
              #
              #
              #
              column(
                #
                #
                #
                wellPanel(
                  #
                  #
                  #
                  h4("Risk ratio"),
                  #
                  #
                  #
                  hr(),
                  #
                  #
                  #
                  conditionalPanel(condition = "input['country.corr'] != '.' & input['select.stats'] == 'risk' & input['x.risk'] != '' & input['y.risk'] != '' & input['z.risk'] != ''",
                    #
                    #
                    #
                    h5("Two by Two Table")
                  ),
                  #
                  #
                  #
                  tableOutput("risk.table"),
                  #
                  #
                  #
                  br(),
                  #
                  #
                  #
                  h5(textOutput("risk.results.header")), 
                  #
                  #
                  #
                  tableOutput("risk.results")
                ),
                #
                #
                #
                width = 4
              )              
            )            
          ),
          #
          #
          #
          width = 9
        )
      ) 
    )
  ),
  #
  #
  #
  tabPanel(title = "Settings",
           value = 3,
           icon = icon(name = "cog", class = "fa-lg"),
    #
    #
    #
    tabsetPanel(
      #
      #
      #
      tabPanel(title = "Datasets",
        #
        #  
        #
        fluidPage(
          #
          #
          #
          fluidRow(
            #
            #
            #
            column(width = 12, br())
          ),
          #
          #
          #
          fluidRow(
            #
            #
            #
            column(width = 3,
              #
              #
              #
              h4("Datasets"),
              #
              #
              #
              hr(),
              #
              #
              #
              tags$p("The application uses a pre-loaded dataset produced by the analysis workflow for the ", 
                     tags$strong("Urban Water and Sanitation Surveys"), 
                     ". If a new results dataset has been produced that includes other country surveys that have been conducted, this can be uploaded here for visualisation. The analysis workflow has been designed to concatenate all results datasets from all country/city surveys into a single dataset called", 
                     tags$code("'surveyResultsAll.csv'"), 
                     "which can be found inside the ", 
                     tags$code("'outputTables'"), "folder of the workflow. This is the dataset that should be uploaded here. The pre-loaded dataset is shown to the right. When a new dataset is uploaded, the table is refreshed to show the uploaded dataset."),
              #
              #
              #
              hr(),
              #
              #
              #
              fileInput(inputId = "file1",
                        label = "Upload results dataset to visualise",
                        accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv"),
                        width = "100%")
            ),
            #
            #
            #
            column(width = 9,
              #
              #
              #
              DT::dataTableOutput("current.data.table")
            )
          )
        )
      ),
      #
      #
      #
      tabPanel(title = "Maps",
        #
        #
        #
        fluidPage(
          #
          #
          #
          fluidRow(
            #
            #
            #
            column(width = 12, br())
          ),
          #
          #
          #
          fluidRow(
            #
            # Create column for uploading maps
            #
            column(width = 3,
              #
              # Header
              #
              h4("Maps"),
				#
				#
				#
				hr(),
				#
				#
				#
				selectInput(inputId = "map.settings",
				  label = "Upload map dataset for",
				  choices = c("Select" = ".",
							  "Dhaka, Bangladesh" = "dhaka",
							  "Accra, Ghana" = "accra",
							  "Nakuru, Kenya" = "nakuru",
							  "Antananarivo, Madagascar" = "antananarivo",
							  "Maputo, Mozambique" = "maputo",
							  "Lusaka, Zambia" = "lusaka"),
				  selected = ".",
				  width = "100%"),
				#
				#
				#
				br(),
				#
				# Dhaka, Bangladesh
				#
				conditionalPanel(condition = "input['map.settings'] == 'dhaka'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.dhaka",
					label = "Select map for Dhaka to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				# Accra, Ghana
				#
				conditionalPanel(condition = "input['map.settings'] == 'accra'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.accra",
					label = "Select map for Accra to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				# Nakuru, Kenya
				#
				conditionalPanel(condition = "input['map.settings'] == 'nakuru'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.nakuru",
					label = "Select map for Nakuru to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				# Antananarivo, Madagascar
				#
				conditionalPanel(condition = "input['map.settings'] == 'antananarivo'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.antananarivo",
					label = "Select map for Antananarivo to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				# Maputo, Mozambique
				#
				conditionalPanel(condition = "input['map.settings'] == 'maputo'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.maputo",
					label = "Select map for Maputo to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				# Lusaka, Zambia
				#
				conditionalPanel(condition = "input['map.settings'] == 'lusaka'",
				  #
				  #
				  #
				  fileInput(inputId = "shp.lusaka",
					label = "Select map for Lusaka to upload",
					accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"),
					multiple = TRUE,
					width = "100%")
				),
				#
				#
				#
				uiOutput("select.dhaka.id"),
				uiOutput("select.accra.id"),
				uiOutput("select.nakuru.id"),
				uiOutput("select.antananarivo.id"),
				uiOutput("select.maputo.id"),
				uiOutput("select.lusaka.id"),
				#
				#
				#
				#conditionalPanel(condition = "input['map.settings'] != '.'",
				  #
				  #
				  #
                #  actionButton(inputId = "use.map",
                #               label = "Use Map",
                #               class = "btn-primary",
                #               icon = icon(name = "location-arrow", clas = "fa-lg"))
                #),
				#
				#
				#
				hr(),
				#
				#
				#
				tags$p("The application uses pre-loaded map datasets for each of the city surveys for the ", 
					   tags$strong("Urban Water and Sanitation Surveys"), ". These pre-loaded map datasets can be updated or changed by uploading a map dataset for each of the cities surveyed that matches the results dataset provided. Specifically, the map dataset should have a data column that identifies the unique areas or zones that were surveyed.")
			  ),
            #    
            #
            # 
            column(width = 9,
              #
              #
              #
              leafletOutput("map.upload", height = 500)
            )             
          )
        )
      )
    )        
  )
)

