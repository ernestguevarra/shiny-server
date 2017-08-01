################################################################################
#
# Server function
#
################################################################################


function(input, output, session) {
  #
  # Read uploaded data
  #
  survey.dataset <- reactive({
    #
    # Use pre-loaded data if no dataset is uploaded
    #
    inputFile <- input$file1
    #
    #
    #
    if(is.null(inputFile)) { current.data }
    #
    # If dataset is uploaded...
    #
    else
      {
      #
      # Read dataset file
      #
      read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
      }
  })
  #
  # Update country select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "country",
      label = "Country",
      choices = list(Select = ".", unique(survey.dataset()$country)),
      selected = "."
    )
  })
  #
  #
  #
  observe({
	#
	#
	#
	if(input$city != "."){
	  #
	  #
	  #
	  updateSelectInput(session = session,
	    inputId = "varSet",
	    label = "Select indicator set",
	    choices = c("Select" = ".", sets),
	    selected = ".")
	}
  })
  #
  #
  #
  observe({
    #
    #
    #
    updateSelectInput(session = session,
	  inputId = "varList",
	  label = "Select indicator",
	  choices = c("Select" = ".",
				  vars[as.character(steerIndicators$varShort)[steerIndicators$varSet == input$varSet]]),
	  selected = ".")
  })
  #
  #
  #
  observeEvent(input$varList != input$varList, {
    #
    #
    #
    updateSelectInput(session = session,
      inputId = "group.by",
      label = "Disaggregate by",
      choices = list(None = ".",
                     "Survey Area" = "surveyArea",
                     "Wealth Quintile" = "wealth"),
      selected = ".")
  })
  #
  #
  #
  observeEvent(input$varList != input$varList, {
    #
    #
    #
    updateSelectInput(session = session,
      inputId = "facet.by",
      label = "Stratify by",
      choices = list(None = ".",
                     "Area Type" = "type"),
      selected = ".")
  })
  #
  # Update city select input based on country/ies in dataset
  #
  observe({
    #
    # Bangladesh
    #
    if(input$country == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".", 
                                    "Dhaka" = "Dhaka"))
    #
    # Ghana
    #
    if(input$country == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Accra" = "Accra"))    
    # 
    # Kenya
    #
    if(input$country == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Nakuru" = "Nakuru"))    
    #
    # Madagascar
    #
    if(input$country == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Antananarivo" = "Antananarivo"))    
    #
    # Mozambique
    #
    if(input$country == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Maputo" = "Maputo"))
    #
    # Zambia
    #
    if(input$country == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city",
                        label = "City",
                        choices = c(Select = ".",
                                    "Lusaka" = "Lusaka"))
  })
  #
  # Update years select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "start.year",
      label = "From",
      choices = unique(survey.dataset()$year)
    )
  })
  #
  # Update years select input based on survey dataset uploaded
  #
  observe({
    updateSelectInput(session = session,
      inputId = "end.year",
      label = "To",
      choices = unique(survey.dataset()$year)[unique(survey.dataset()$year) >= input$start.year]
    )
  })
  #
  #
  #
  sub.data <- reactive({
    #
    #
    #
    subset(survey.dataset(),
           subset = country == input$country & 
                    year >= input$start.year & year <= input$end.year &
                    indicatorCode == input$varList)
  })
  #
  #
  #
  ladder.data <- reactive({
    #
    #
    #
    subset(survey.dataset(),
           subset = country == input$country & 
                    year >= input$start.year & year <= input$end.year &
                    indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$varSet])                    
  })
  #
  # Create map data for slum areas of current city and indicator
  #
  slum.map.data <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
                   type == "Slum" &
                   !strata %in% c(paste("Wealth Quintile ", 1:5, sep = ""), "Overall"))
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      temp$estimate <- temp$estimate * 100
      }
    #
    #
    #
    merge(dhaka.map, temp, by.x = "surveyArea", by.y = "strata")
  })
  #
  # Create map data for city areas of current city and indicator
  #
  city.map.data <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
                   type == "Citywide" &
                   !strata %in% c(paste("Wealth Quintile ", 1:5, sep = ""), "Overall"))
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      temp$estimate <- temp$estimate * 100
      }
    #
    #
    #
    merge(dhaka.map, temp, by.x = "surveyArea", by.y = "strata")
  })
  #
  #
  #
  output$panel.header <- reactive({
    #
    #
    #
    paste(input$city, ", ", input$country, sep = "")
  })
  #
  #
  #
  output$indicator.header <- reactive({
    #
    #
    #
    paste(steerIndicators$varNames[steerIndicators$varList == input$varList])
  })
  #
  #
  #
  output$year.header <- reactive({
    #
    #
    #
    if(input$start.year == input$end.year)
      {
      paste(input$start.year, sep = "")
      }
    #
    #
    #
    else
      {
      paste(input$start.year, " - ", input$end.year, sep = "")
      }
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.map.data()[[input$varList]], city.map.data()[[input$varList]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour",
                        label = "Mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval"),
                        selected = "interval")
    #
    #
    #
    if(class(xx) != "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour",
                        label = "Mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       


################################################################################
#
# Dynamic UI
#
################################################################################
  #
  #
  #
  output$overall.estimate <- reactive({
    #
    #
    #
    temp <- subset(sub.data(), 
	  			   strata == "Overall" & 
				   type == "Citywide")
    #
    #
    #
    estimate <- paste(round(temp$estimate[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%", sep = "")
    #
    # If varList is not proportion...
    #
    if(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
	  {
	  #
	  #
	  #
	  estimate <- paste(round(temp$estimate[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1), sep = "")
	  }
    #
    #
    #
    estimate
  })
  #
  #
  #
  output$ci.estimate <- reactive({
    #
    #
    #
    temp <- subset(sub.data(),
                   strata == "Overall" &
                   type == "Citywide")
    #
    #
    #
    ci <- paste("95% CI: ", 
                round(temp$LCL[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%",
                " - ",
                round(temp$UCL[temp$strata == "Overall" & temp$type == "Citywide"] * 100, digits = 1), "%",
                sep = "")
    #
    #
    #
    if(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      ci <- paste("95% CI: ", 
                  round(temp$LCL[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1),
                  " - ",
                  round(temp$UCL[temp$strata == "Overall" & temp$type == "Citywide"], digits = 1),
                  sep = "")
      }
    #
    #
    #
    ci
  })
  #
  #
  #
  output$error.bar <- renderUI({
    #
    #
    #
    if(input$varList != "." & input$group.by != "." | input$facet.by != ".")
      {
      #
      #
      #
      checkboxInput(inputId = "error.bar", 
                    label = "Error bars",
                    value = FALSE)
      }
  })
  #
  #
  #
  output$city.table.header <- reactive({
    #
    #
    #
    paste("Sampling List: ", input$var.city.area, " - ", input$city.area.name)
  })
  #
  #
  #
  output$slum1.table.header <- reactive({
    #
    #
    #
    paste("Sampling List: ", input$var.slum.area1, " - ", input$slum.area.name1)
  })
  #
  #
  #
  output$slum2.table.header <- reactive({
    #
    #
    #
    paste("Sampling List: ", input$var.slum.area2, " - ", input$slum.area.name2)
  })


################################################################################
#
# Modal dialogs
#
################################################################################
  #
  #
  #
  observeEvent(input$info1, {
    #
    #
    #
    showModal(modalDialog(withMathJax(),
                          title = "Chart Options",
                          size = "l",
                          HTML("
                            <h4>Country</h4>
                            <p>Choose country data to visualise. The choices of countries to select from is based on the pre-loaded or user-provided data</p>
                            <br/>
                            
                            <h4>City</h4>
                            <p>Choose city data to visualise. The choices of cities to select from is based on the country selected and on the pre-loaded or user-provided data</p>
                            <br/>
                            
                            <h4>From - To</h4>
                            <p>Choose year/s of data to visualise. The range of years to select from is based on the country and city selected and on the pre-loaded or user-provided data</p>
                            <br/>
                            
                            <h4>Select indicator set</h4>
                            <p>Indicators for the <code>Urban Water and Sanitation Survey</code> are organised into thirteen indicator sets. These are: 1) <em>Demographics</em>; 2) <em>Types of Water Sources</em>; 3) <em>Access to Water Sources</em>; 4) <em>Other Water Indicators</em>; 5) <em>Types of Sanitation Facilities</em>; 6) <em>Access to Sanitation Facilities</em>; 7) <em>Sanitation Practices and Behaviours</em>; 8) <em>Other Sanitation Indicators</em>; 9) <em>Women Hygiene</em>; 10) <em>Handwashing</em>; 11) <em>Access to All Services</em>; 12) <em>Overall Expenditure</em>; and, 13) <em>Poverty</em>.</p>
                            <br/>
                            
                            <h4>Select Indicator</h4>
                            <p><strong>Mean number of household members</strong></p>
                            <p>This indicator is based on the self-report of number of household members.</p>

                            <br/>                    
                            <p><strong>Progress out of Poverty Index (PPI)</strong></p>
                            <p>The <code>Progress out of Poverty Index (PPI)</code> is a measure of poverty developed by <a href='http://www.grameenfoundation.org' target='_blank'>Grameen Foundation</a> in collaboration with the <a href='https://www.fordfoundation.org' target='_blank'>Ford Foundation</a>, and managed by the <a href'http://www.poverty-action.org' target='_blank'>Innovations for Poverty Action</a>. The first <code>PPI</code> was released in 2006 and has since then been customised for 45 countries. The <code>PPI</code> is based on a country-specific 10-item questionnaire about a household’s characteristics and asset ownership which is scored to compute the likelihood that a household is living below country-specific and universal poverty line thresholds.</p>

                            <br/>                            
                            <p><strong>Poverty Likelihood ($1.25 a day)</strong></p>
                            <p>This is the measure of the probability that a household is below the <code>$1.25 purchasing power parity (PPP)</code> poverty threshold of 2005. The likelihood is determined through pre-calculated and country-specific probabilites based on the household <code>PPI</code>. Other <code>PPI</code>-based poverty likelihoods using other country-specific and or global poverty thresholds are available.</p> 
                            
                            <br/>                            
                            <p><strong>Wealth Quintile</strong></p>
                            <p>This is the classification or grouping of each household into quintiles based on <code>PPI</code> with those in the lowest quintile (wealth quintile 1) having the lowest fifth <code>PPI</code> and those in the highest quintile (wealth quintile 5) having the highest fifth <code>PPI</code>.</p>

                            <br/>
                            <p><strong>Types of Water Sources</strong></p>
                            <p><code>Safely managed:</code> Drinking water from an improved water source which is located on premises, available when needed and free of faecal and priority contamination. </p>
                            <p><code>Basic:</code> Drinking water from an improved source provided collection time is not more than 30 minutes for a roundtrip including queuing.</p> 
                            <p><code>Limited:</code> Drinking water from an improved source where collection time exceeds over 30 minutes for a roundtrip to collect water, including queuing.</p>
                            <p><code>Unimproved:</code> Drinking water from an unimproved dug well or unprotected spring</p>
                            <p><code>Surface water:</code> Drinking water directly from a river, dam, lake, pond, stream, canal or irrigation channel.</p>

                            <br/>
                            <p><strong>Access to sufficient and sustained drinking water</strong></p>
                            <p><code>Percentage of households with access to sufficient and sustained drinking water</code>: Sufficient is defined as <code>>50 litres per person per day</code>. Sustained is defined as drinking water available <code>24 hours per day</code>, <code>7 days a week</code> and <code>throughout the year</code>.</p>

                            <br/>                                                          
                            <p><strong>Access to safe and acceptable drinking water for all</strong></p>
                            <p><code>Percentage of households with good self-reported quality of drinking water:</code> No objective water quality assessment was performed during the survey. This indicator, as stated, is based on self-reported perception of water quality.</p>
                            <p><code>Percentage of households that are safely storing drinking water:</code> Safe storage is defined as drinking water stored in a clean container with lid only.</p>

                            <br/>                                  
                            <p><strong>Access to affordable drinking water</strong></p>
                            <p><code>Mean expenditure in drinking water by wealth quintile:</code> mean expenditure in drinking water per household per year by wealth quintile. It should be noted that expenditure alone does not indicate affordable access to drinking water. The ideal and recommened indicator is yearly expenditure on water as a fraction of annual income i.e., \\(\\frac{\\mu_\\text{Household yearly expenditure on water}}{\\text{Household annual income}}\\). However, the surveys did not collect data on household income hence this recommended indicator cannot be calculated.</p>

                            <br/>                                                         
                            <p><strong>Physical access to drinking water</strong></p>                             
                            <p><code>Percentage of households with adequate physical access to drinking water:</code> Adequate physical access is defined as source of drinking water is located within <code>30 minutes</code> from home</p>

                            <br/>                                                          
                            <p><strong>Formal water service provision</strong></p>
                            <p><code>Percentage of households with formal drinking water service provision:</code> Formal drinking water service provision is defined as drinking water provided by a formal service according to interviewer asessment.</p>
                            <p><code>Percentage of households relying on formal provider for service supply maintenance:</code> Formal provider for service supply maintenance is defined as a household with a formal service provider contact person in case of problems with water supply.</p>

                            <br/>
                            <p><strong>Sanitation Service Ladder</strong></p>       
                            <p><code>Safely managed:</code> Use of an improved sanitation facility which is not shared with other households and where excreta are safely disposed in situ or transported and treated off-site.</p>
                            <p><code>Basic:</code> Use of improved facilities which are not shared with other households.</p>
                            <p><code>Limited:</code> Use of improved facilities shared between two or more households.</p>
                            <p><code>Unimproved:</code> Use of pit latrines wihtout a slab or platform, hanging latrines and bucket latrines</p>
                            <p><code>Open defecation:</code> Disposal of human faeces in fields, forest, bushes, open bodies of water, beaches or other open spaces or with solid waste.</p>

                            <br/>
                            <p><strong>Access to sufficient and sustained drinking water</strong></p>
                            <p><code>Percentage of households with access to sufficient and sustained drinking water</code>: Sufficient is defined as <code>>50 litres per person per day</code>. Sustained is defined as drinking water available <code>24 hours per day</code>, <code>7 days a week</code> and <code>throughout the year</code>.</p>
                             
                            <br/> 
                            <p><strong>Access to safe and acceptable drinking water for all</strong></p>
                            <p><code>Percentage of households with good self-reported quality of drinking water:</code> No objective water quality assessment was performed during the survey. This indicator, as stated, is based on self-reported perception of water quality.</p>
                            <p><code>Percentage of households that are safely storing drinking water:</code> Safe storage is defined as drinking water stored in a clean container with lid only.</p>
     
                            <br/>
                            <p><strong>Access to affordable drinking water</strong></p>
                            <p><code>Mean expenditure in drinking water by wealth quintile:</code> mean expenditure in drinking water per household per year by wealth quintile. It should be noted that expenditure alone does not indicate affordable access to drinking water. The ideal and recommened indicator is yearly expenditure on water as a fraction of annual income i.e., \\(\\frac{\\mu_\\text{Household yearly expenditure on water}}{\\text{Household annual income}}\\). However, the surveys did not collect data on household income hence this recommended indicator cannot be calculated.</p>
                             
                            <br/>
                            <p><strong>Physical access to drinking water</strong></p>                             
                            <p><code>Percentage of households with adequate physical access to drinking water:</code> Adequate physical access is defined as source of drinking water is located within <code>30 minutes</code> from home</p>
                             
                            <br/>
                            <p><strong>Formal water service provision</strong></p>
                            <p><code>Percentage of households with formal drinking water service provision:</code> Formal drinking water service provision is defined as drinking water provided by a formal service according to interviewer asessment.</p>
                            <p><code>Percentage of households relying on formal provider for service supply maintenance:</code> Formal provider for service supply maintenance is defined as a household with a formal service provider contact person in case of problems with water supply.</p>

                            <br/>
                            <p><strong>Use of adequate hygienic materials for menstrual hygiene management</strong></p>
                            <p><code>Percentage of households using adequate hygienic materials foe MHM</code>: Adequate hygienic maetrials are cloths, pads, tampons or menstrual cups</p>
                                                          
                            <br/>
                            <p><strong>Hygienic and adequate disposal of menstrual hygiene materials</strong></p>
                            <p><code>Percentage of households practicing good mentrual hygiene practies/behaviour:</code> Good menstrual hygiene management includes cloths washed with soap and water and napkins/pads disposed of in the rubbish bin.</p>
     
                            <br/> 
                            <p><strong>Comfort with sanitation facilities during menstruation</strong></p>
                            <p><code>Percentage of households in which women and girls are comfortable using sanitation facility during menstruation:</code></p>                             

                            <br/>
                            <p><strong>Overall access to adequate water and sanitation services</strong></p>
                            <p><code>Percentage of Households with access to adequate water and sanitation services by quintile</code>: Adequate water services and adequate sanitation services as defined.</p>
                            <ul>
                              <li>Percentage of households with access to adequate sanitation and adequate drinking water</li>
                              <li>Percentage of households with access to adequate sanitation only</li>
                              <li>Percentage of households with access to adequate drinking water only</li>
                              <li>Percentage of households with no access to adequate services</li>
                            </ul>
                            
                            <br/>
                            <h4>Disaggregate by</h4>
                            <p>Select from choices of data variables to be used for grouping / disaggregating the data. When applied to charts, data is grouped based on the selected variable and then plotted accordingly on a single chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                               
                            <br/>                             
                            <h4>Stratify by</h4>
                            <p>Select from choices of data variables to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                          ")))                       
  })
  #
  #
  #
  observeEvent(input$info2, {
    #
    #
    #
    showModal(modalDialog(withMathJax(),
                          title = "Map Options",
                          size = "l",
                          HTML("
                            <h4>Select colour palette</h4>
                            <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                            <ul>
                              <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                              <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                            </ul>
                            <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                            <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                            
                            <br/>
                            <h4>Select colour mapping method</h4>
                            <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                            <ul>
                              <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                              <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                              <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                            </ul>
                            
                            <br/>                            
                            <h4>Number of bins</h4>
                            <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                            
                            <br/>
                            <h4>Number of classes</h4>
                            <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                          ")))                       
  })
  #
  #
  #
  observeEvent(input$info3, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "City map data input",
                           size = "l",
                           HTML("
                             <h4>Upload map of citywide survey area</h4>
                             <p>The map should be in ESRI Shapefile format (SHP). This file format requires a minimum of 3 related files in order to be readable. These files are the <code>.SHP</code>, <code>.SHX</code> and <code>.DBF</code>. Hence, these three files should be uploaded all at the same time by clicking on CTRL and then selecting at least the three files for upload. A warning will pop out if the incorrect file formats and/or incomplete number of files are uploaded. Once the files have been uploaded, two new options come out. First, the app asks for the vaiable name in the map files that contains the stratifying variable. This would be the variable name of a geographic subdivision by which you decided to divide the city. Second, a prompt for the number of primary sampilng units or <code>PSU</code> comes to view. This is set at a default of 30. Once you have specified these parameters, you can click on <code>Sample</code> and corresponding sampling maps will be produced on the main panel and corresponding sampling lists on the appropriate sampling tabs.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info4, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Slum map data input",
                           size = "l",
                           HTML("
                             <h4>Available slum area sampling information</h4>
                             <p>For slum areas, you are first asked what information you have on slums that can be used for sampling: <code>slum maps</code> or <code>slum lists</code>. If you have slum maps, then you are given the options for sampling with slum maps (below). If you have lists, then you are given the option for sampling with slum lists (below).</p>
                             
                             <br/>
                             <h4>Upload map of slum survey area</h4>
                             <p>The map should be in ESRI Shapefile format (SHP). This file format requires a minimum of 3 related files in order to be readable. These files are the <code>.SHP</code>, <code>.SHX</code> and <code>.DBF</code>. Hence, these three files should be uploaded all at the same time by clicking on CTRL and then selecting at least the three files for upload. A warning will pop out if the incorrect file formats and/or incomplete number of files are uploaded. Once the files have been uploaded, two new options come out. First, the app asks for the vaiable name in the map files that contains the stratifying variable. This would be the variable name of a geographic subdivision by which you decided to divide the city. Second, a prompt for the number of primary sampilng units or <code>PSU</code> comes to view. This is set at a default of 30. Once you have specified these parameters, you can click on <code>Sample</code> and corresponding sampling maps will be produced on the main panel and corresponding sampling lists on the appropriate sampling tabs.</p>

                             <br/>
                             <h4>Upload list of slum areas</h4>
                             <p>The list of slum areas should be in CSV format. The list should be organised and sorted along the stratifying variable for survey areas. Once the list has been uploaded, you will need to specify how many <code>PSUs</code> will be survyed. Then press on <code>Sample</code>. A sample list from the complete list is now available on the <code>Slum Lists</code> tab.</p>
                           ")))
  })

  
################################################################################
#
# Plot indicators
#
################################################################################
  #
  #
  #
  output$bar.plot <- renderPlot({
    #
    #
    #
    temp <- subset(sub.data(), 
                   strata == "Overall" & 
                   type == "Citywide")
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = ""))
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = ""))
      } 
    #
    #
    #
    if(input$group.by == "." & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(sub.data(), 
                     strata == "Overall")
      } 
    #
    #
    #
    basePlot <- ggplot(data = temp,
                       mapping = aes(x = strata,
                                     y = estimate))
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", 
                        position = "dodge",
                        alpha = 0.6,
                        fill = wsupColour,
                        colour = wsupColour)
    #
    #
    #
    barCI <- geom_crossbar(mapping = aes(ymin = LCL, ymax = UCL), 
                           width = 0.5, 
                           size = 0.75, 
                           fatten = 3, 
                           colour = errorColour)
    #
    #
    #
    if(input$facet.by != ".")
      {
      #
      #
      #
      barFacet <- facet_grid(facets = . ~ type)
      }
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$varList %in% c("water12", "san14") & input$country == "Bangladesh", "Bangladesh Taka (BDT)", 
                         ifelse(input$varList == "san13", "Time (minutes)", 
                           ifelse(input$varList == "pQuintile", "Quintiles", 
                             ifelse(input$varList == "nMembers", "No. of Household Members", "Proportion")))))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$group.by == "surveyArea", "Survey Area",
                         ifelse(input$group.by == "wealth", "Wealth Quintile",
                           ifelse(input$facet.by == "type", "Area Type", ""))))
    #
    #
    #
    indicator.plot <- basePlot + barPlot + theme_wsup + yLabel + xLabel
    #
    #
    #
    if(input$group.by == "." & input$facet.by == ".")
      {
      #
      #
      #
      crossBar <- geom_crossbar(data = temp,
                                mapping = aes(ymin = LCL, ymax = UCL),
                                width = 0.25,
                                size = 0.5,
                                fatten = 5,
                                colour = wsupColour)
      #
      #
      #
      pointBar <- geom_pointrange(mapping = aes(ymin = LCL, ymax = UCL),
                                  size = 2,
                                  fatten = 5,
                                  colour = wsupColour)
      #
      #
      #
      estText <- annotate(geom = "text", 
                          x = temp$strata, 
                          y = temp$estimate + 0.01, 
                          label = temp$estimate,
                          size = 8)
      #
      #
      #
      lclText <- annotate(geom = "text", 
                          x = temp$strata, 
                          y = temp$LCL, 
                          label = temp$LCL,
                          size = 5)
      #
      #
      #
      uclText <- annotate(geom = "text", 
                          x = temp$strata, 
                          y = temp$UCL, 
                          label = temp$UCL,
                          size = 5)
      #
      #
      #
      indicator.plot <- basePlot + crossBar + theme_wsup + yLabel + xLabel
      }
    #
    #
    #
    if(!input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"))
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,1))
      }
    #
    #
    #
    if(input$varList == "ppi")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,100))
      }
    #
    #
    #
    if(input$varList == "pQuintile")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + ylim(c(0,5))
      }
    #
    #
    #  
    if(input$facet.by != "." & input$varList != ".")
      {
      #
      # 
      #
      indicator.plot <- indicator.plot + barFacet
      }
    #
    #
    #
    if(input$group.by != ".")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
      }
    #
    #
    #
    if(!is.null(input$error.bar) & input$group.by != "." | input$facet.by != ".")
      {
      #
      #
      #
      if(input$error.bar)
        {
        #
        #
        #
        indicator.plot <- indicator.plot + barCI
        }
      }
  #
  #
  #
  if(input$varSet %in% c("waterSet1", "sanSet1", "handSet", "overallSet1") & input$varList == ".")
    {
    #
    #
    #
    temp <- subset(ladder.data(), 
                   strata == "Overall" & 
                   type == "Citywide")
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "surveyArea" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Survey Area ", 1:9, sep = ""))
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == ".")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = "") &
                     type == "Citywide")
      }
    #
    #
    #
    if(input$group.by == "wealth" & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata %in% paste("Wealth Quintile ", 1:5, sep = ""))
      } 
    #
    #
    #
    if(input$group.by == "." & input$facet.by == "type")
      {
      #
      #
      #
      temp <- subset(ladder.data(), 
                     strata == "Overall")
      } 
    #
    #
    #
    basePlot <- ggplot(data = temp,
                       mapping = aes(x = strata,
                                     y = estimate,
                                     fill = rev(indicatorCode)))
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", 
                        position = "fill",
                        alpha = 0.6)
    #
    #
    #
    if(input$varSet == "waterSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Drinking Water Ladder",
                                   labels = c("Safely-managed",
                                              "Basic",
                                              "Limited",
                                              "Unimproved",
                                              "Surface Water"),
                                   values = waterLadder)
      }
    #
    #
    #
    if(input$varSet == "sanSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Sanitation Ladder",
                                   labels = c("Safely-managed",
                                              "Basic",
                                              "Limited",
                                              "Unimproved",
                                              "Open defecation"),
                                   values = sanitationLadder)
      }
    #
    #
    #
    if(input$varSet == "handSet")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Handwashing Ladder",
                                   labels = c("Basic",
                                              "Limited",
                                              "No facility"),
                                   values = handwashLadder)
      }
    #
    #
    #
    if(input$varSet == "overallSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Services Access",
                                   labels = c("Adequate water and sanitation",
                                              "Adequate water only",
                                              "Adequate sanitation only",
                                              "No access to adequate services"),
                                   values = rev(overallColour))
      }
    #
    #
    #
    if(input$facet.by != ".")
      {
      #
      #
      #
      barFacet <- facet_grid(facets = . ~ type)
      }
    #
    # y-axis labels
    #
    yLabel <- labs(y = "Proportion")
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$group.by == "surveyArea", "Survey Area",
                         ifelse(input$group.by == "wealth", "Wealth Quintile",
                           ifelse(input$facet.by == "type", "Area Type", ""))))
    #
    #
    #
    indicator.plot <- basePlot + barPlot + barFill + theme_wsup + xLabel + yLabel
    #
    #
    #  
    if(input$facet.by != ".")
      {
      #
      # 
      #
      indicator.plot <- indicator.plot + barFacet
      }
    #
    #
    #
    if(input$group.by != ".")
      {
      #
      #
      #
      indicator.plot <- indicator.plot + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
      }
    #
    #
    #
    print(indicator.plot)
    }
  #
  #
  #
  print(indicator.plot)
  #
  #
  #
  }, height = 320)                    
  #
  #
  #
  survey.area.map <- reactive({
    #
    # If selected country is Bangladesh and selected city is Dhaka
    #
    if(input$country == "Bangladesh" & input$city == "Dhaka")
      {
      #
      #
      #
      inputFile <- input$shp.dhaka
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { dhaka.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
    #
    # If selected country is Ghana and selected city is Accra
    #
    if(input$country == "Ghana" & input$city == "Accra")
      {
      #
      #
      #
      inputFile <- input$shp.accra
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { accra.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
    #
    # If selected country is Kenya and selected city is Nakuru
    #
    if(input$country == "Kenya" & input$city == "Nakuru")
      {
      #
      #
      #
      inputFile <- input$shp.nakuru
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { nakuru.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
    #
    # If selected country is Madagascar and selected city is Antananarivo
    #
    if(input$country == "Madagascar" & input$city == "Antananarivo")
      {
      #
      #
      #
      inputFile <- input$shp.antananarivo
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { antananarivo.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
    #
    # If selected country is Mozambique and selected city is Maputo
    #
    if(input$country == "Mozambique" & input$city == "Maputo")
      {
      #
      #
      #
      inputFile <- input$shp.maputo
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { maputo.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
    #
    # If selected country is Zambia and selected city is Lusaka
    #
    if(input$country == "Zambia" & input$city == "Lusaka")
      {
      #
      #
      #
      inputFile <- input$shp.lusaka
      #
      # If no map is uploaded, use pre-loaded map
      #
      if(is.null(inputFile)) { lusaka.map }
      #
      #
      #
      infiles <- inputFile$datapath
      dir <- unique(dirname(infiles))
      outfiles <- file.path(dir, inputFile$name)
      purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
      #
      # Read shapefile
      #
      x <- try(readOGR(dsn = dir, 
               layer = strsplit(inputFile$name[1], "\\.")[[1]][1]), 
               verbose = TRUE)
      #
      # If uploaded file is readable...
      #
      if(class(x) == "try-error")
        {
        NULL 
        } 
      else 
        {
        #
        # Transform shapefiles into WGS84 longlat
        #
        x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
        }
      }
  })
  #
  #
  #
  observeEvent(input$shp.dhaka, {
    updateSelectInput(session = session,
                      inputId = "survey.area.id",
                      label = "Select map data identifier for survey areas",
                      choices = names(survey.area.map()))
  })  
  #
  # Map baselayer
  #  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(
        urlTemplate = mapbox.standard,
        attribution = "Maps by <a href = 'http://www.mapbox.com/'>Mapbox</a>"
      ) %>%
      #addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
      setView(lng = 20, lat = 20, zoom = 3)
  })
  #
  # Get map centre and/or bounds of selected country
  #
  survey.country <- reactive({
    #
    #
    #
    if(input$country != ".") {
      #
      #
      #
      geocode(input$country, output = "more", messaging = FALSE)
    }
  })
  #
  # Get map centre and/or bounds of selected city
  #
  survey.city <- reactive({
    #
    #
    #
    if(input$city != ".") {
      #
      #
      #
      geocode(input$city, output = "more")
    }
  })
  #
  # Zoom in to selected country
  #
  observe({
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    fitBounds(lng1 = survey.country()$east, lat1 = survey.country()$north,
  		      lng2 = survey.country()$west, lat2 = survey.country()$south)
  })    
  #
  # Zoom in to selected city
  #
  observe({
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    fitBounds(lng1 = survey.city()$east, lat1 = survey.city()$north,
  		      lng2 = survey.city()$west, lat2 = survey.city()$south)
  }) 
  #
  # Clear maps when indicator set is changed
  #
  observeEvent(input$varSet != input$varSet, {
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    clearShapes() %>%
    #
    #
    #
    clearControls() %>%
    #
    #
    #
    removeLayersControl()
  }) 
  #
  # Clear maps when indicator is set to none == "."
  #
  observeEvent(input$varList == ".", {
    #
    #
    #
    leafletProxy("map") %>%
    #
    #
    #
    clearShapes() %>%
    #
    #
    #
    clearControls() %>%
    #
    #
    #
    removeLayersControl()
  }) 
  #
  # Plot indicator maps
  #   
  observe({
    #
    #
    #
    if(input$varList != ".")
      {
	  #
	  # 
 	  #
	  if(input$map.colour == "linear")
	    {
	    #
	    #
	    #
	    values <- c(0, max(c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])))      
	    #
	    #
	    #
	    pal <- colorNumeric(palette = input$map.palette,
		  				    domain = values)
	    }
	  #
	  #
	  #
	  if(input$map.colour == "interval")
	    {
	    #
	    #
	    #
	    values <- c(0, max(c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])))
	    #
	    #
	    #
	    pal <- colorBin(palette = input$map.palette, 
					    domain = values,
					    pretty = TRUE,
					    bins = ifelse(is.null(input$map.bins), 5, input$map.bins))
	    }
	  #
	  #
	  #
	  if(input$map.colour == "quantile")
	    {
	    #
	    #
	    #
	    pal <- colorQuantile(palette = input$map.palette,
		   				     domain = c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]]),
						     n = ifelse(is.null(input$map.quantiles), 5, input$map.quantiles))
	    #
	    #
	    #
	    values <- c(slum.map.data()[["estimate"]], city.map.data()[["estimate"]])
	    }
	  #
	  #
	  #  
	  slum.labels <- paste(slum.map.data()$surveyArea, ": ", round(slum.map.data()[["estimate"]], digits = 1), sep = "")
	  city.labels <- paste(city.map.data()$surveyArea, ": ", round(city.map.data()[["estimate"]], digits = 1), sep = "")
	  #
	  #
	  #
	  leafletProxy("map") %>%
	  #
	  #
	  #
	  clearShapes() %>%
	  #
	  #
      #
      clearControls() %>%
	  #
	  # Slum polygon
 	  #
	  addPolygons(
	    data = slum.map.data(),
	    fillColor = pal(slum.map.data()[["estimate"]]),
	    weight = 2,
	    opacity = 1,
	    color = "white",
	    dashArray = "",
	    fillOpacity = 0.7,
	    highlight = highlightOptions(
		  weight = 5,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0.7,
		  bringToFront = TRUE),
	    label = slum.labels,
	    labelOptions = labelOptions(
		  style = list("font-weight" = "normal", padding = "3px 8px"),
		  textsize = "12px",
		  direction = "auto"),
	    group = "Slum") %>%
	  #
	  # Citywide polygon
	  #
	  addPolygons(
	    data = city.map.data(),
	    fillColor = pal(city.map.data()[["estimate"]]),
	    weight = 2,
	    opacity = 1,
	    color = "white",
	    dashArray = "",
	    fillOpacity = 0.7,
	    highlight = highlightOptions(
		  weight = 5,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0.7,
		  bringToFront = TRUE),
	    label = city.labels,
	    labelOptions = labelOptions(
		  style = list("font-weight" = "normal", padding = "3px 8px"),
		  textsize = "12px",
		  direction = "auto"),
	    group = "Citywide") %>%
	  #
	  #
	  #
	  addLegend(pal = pal, values = values, opacity = 0.7,
		position = "bottomright", 
		labFormat = ifelse(input$map.colour == "quantile" & !input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), legend.format(digits = 1, between = " to ", suffix = "%"),
		              ifelse(input$map.colour == "quantile" & input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), legend.format(digits = 1, between = " to "),
		                ifelse(input$varList %in% c("water12", "san13", "san14", "acceptScore", "overallSpend", "ppi", "pQuintile", "nMembers"), labelFormat(digits = 1, between = " to "), labelFormat(digits = 1, between = " to ", suffix = "%")))),
		#title = steerIndicators$varShort[steerIndicators$varList == input$varList],
		layerId = "legend") %>%
	  #
	  #
	  #
	  addLayersControl(
		baseGroups = c("Slum", "Citywide"),
		#overlayGroups = c("Upazila", "Wards"),
		position = "topleft",
		options = layersControlOptions(collapsed = FALSE, autoZIndex = TRUE)) #%>%
	  #
	  #
	  #
    }
  })
  
  
################################################################################
#
# Sample size function
#
################################################################################
  #
  #
  #
  sample.df <- reactive({
    #
    #
    #
    inputFile <- input$file2
    #
    #
    #
    if(is.null(inputFile))
      {
      #
      #
      #
      return(NULL)
      }
    #
    #
    #
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })    

  #
  #
  #
  observe({
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "variable",
                        label = "Select variable name of indicator to test",
                        choices = names(sample.df()))
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "cluster",
                        label = "Select variable name of survey cluster",
                        choices = names(sample.df()))
  })
  #
  #
  #
  observeEvent(input$calculate1, {
	  #
	  #
	  #
	  z.value <- ifelse(input$z.ci == "1.96", "95% CI",
			   	   ifelse(input$z.ci == "1.75", "92% CI",
				     ifelse(input$z.ci == "1.645", "90% CI", "96% CI")))
	  #
	  # Calculate sample size
	  #
	  sample.size1 <- (as.numeric(input$z.ci) ^ 2) * (((input$proportion / 100) * (1 - (input$proportion / 100))) / ((input$precision / 100) ^ 2))
	  #    
	  # Compose data frame
	  #
	  sample.parameters <- data.frame(Parameters = c("z-value", 
													 "Prevalence",
													 "Precision",
													 "Sample size"),
									  Value = as.character(c(paste(input$z.ci, " (", z.value, ")", sep = "") , 
										 					 paste(input$proportion, "%", sep = ""),
															 paste(input$precision, "%", sep = ""),
															 ceiling(sample.size1))), 
									  stringsAsFactors = FALSE)
      #
      #
      #
      output$sample.header <- renderText({
        #
        #
        #
        "Sample size parameters and estimate (SRS)"
      })
	  #
	  #
	  #
	  output$sample <- renderTable({
	    #
	    #
        #
		sample.parameters
	  })
  })
  #
  #
  #
  observeEvent(input$reset1, {
      #
      #
      #
      output$sample.header <- renderText({NULL})
      #
      #
      #
      output$sample <- renderTable({NULL})
      #
      #
      #
      shinyjs::reset("sample-size")
  })
  #
  #
  #
  observeEvent(input$surveyType == "cluster", {
      #
      #
      #
      output$sample.header <- renderText({NULL})
      #
      #
      #
      output$sample <- renderTable({NULL})
  })
  #
  #
  #
  observeEvent(input$calculate2, {
      #
      # Assign deff
      #
      design.effect <- 5
	  #
	  # Calculate deff
	  #
	  if(!is.null(input$file2))
	    {
	    #
        # Design effect
        #
	    #design.effect <- deff(y = sample.df()[[input$variable]], cluster = sample.df()[[input$cluster]])[["deff"]]
	    #
	    #
	    #
	    icc <- deff(y = sample.df()[[input$variable]], cluster = sample.df()[[input$cluster]])[["rho"]]
	    #
	    #
	    #
	    design.effect <- 1 + (input$cluster.size - 1) * icc
	    }
	  #
	  #
	  #
	  z.value <- ifelse(input$z.ci == "1.96", "95% CI",
			   	   ifelse(input$z.ci == "1.75", "92% CI",
				     ifelse(input$z.ci == "1.645", "90% CI", "96% CI")))
	  #
	  # Calculate sample size
	  #
	  sample.size2 <- design.effect * (as.numeric(input$z.ci) ^ 2) * (((input$proportion / 100) * (1 - (input$proportion / 100))) / ((input$precision / 100) ^ 2))
	  #    
	  # Compose data frame
	  #
	  deff.parameters <- data.frame(Parameters = c("z-value", 
												   "Prevalence",
												   "Precision",
												   "Cluster size",
												   "ICC",
												   "Design effect of planned survey",
												   "Sample size"),
									Value = as.character(c(paste(input$z.ci, " (", z.value, ")", sep = "") , 
										 				   paste(input$proportion, "%", sep = ""),
														   paste(input$precision, "%", sep = ""),
									                       paste(input$cluster.size, "samples per cluster", sep = " "),
									                       ifelse(is.null(input$file2), "No data", round(icc, digits = 4)), 
								                           ifelse(is.null(input$file2), paste(design.effect, "(assumed)", sep = " "), paste(round(design.effect, digits = 4), "(based on data)", sep = " ")),
								                           ceiling(sample.size2))),
                                    stringsAsFactors = FALSE)      
      #
      #
      #
      output$deff.header <- renderText({
        #
        #
        #
        "Sample size parameters and estimate (Cluster Sample)"
      })
	  #
	  #
	  #
	  output$deff <- renderTable({
	    #
	    #
        #
		deff.parameters
	  })
  })
  #
  #
  #
  observeEvent(input$reset2, {
      #
      #
      #
      output$deff.header <- renderText({NULL})
      #
      #
      #
      output$deff <- renderTable({NULL})
  })
################################################################################
#
# Spatial sampling
#
################################################################################
  #
  #
  #
  output$map.sampling <- renderLeaflet({
    leaflet() %>%
      #addTiles(
      #  urlTemplate = mapbox.northstar,
      #  attribution = "Maps by <a href='http://www.mapbox.com/'>Mapbox</a>"
      #) %>%
      addProviderTiles(providers$Esri.NatGeoWorldMap) %>%      
      setView(lng = 20, lat = 20, zoom = 3)
  })

################################################################################
#
# Read shapefile
#
################################################################################
  #
  #
  #
  city.map <- reactive({
    #
    #
    #
    inputFile <- input$shp1
    #
    #
    #
    if(is.null(inputFile)) { return(NULL) }
    #
    #
    #  
    infiles <- inputFile$datapath
    #
    #
    #
    dir <- unique(dirname(infiles))
    #
    #
    #
    outfiles <- file.path(dir, inputFile$name)
    #
    #
    #
    purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
    #
    #
    #
    x <- try(readOGR(dir, strsplit(inputFile$name[1], "\\.")[[1]][1]), TRUE)
    #
    #
    #
    if(class(x) == "try-error") NULL 
    #
    #
    #
    else
    #
    # Transform shapefiles into WGS84 longlat
    #
    x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
  })
  #
  #
  #
  slum.map <- reactive({
    #
    #
    #
    inputFile <- input$shp2
    #
    #
    #
    if(is.null(inputFile)) { return(NULL) }
    #
    #
    #  
    infiles <- inputFile$datapath
    #
    #
    #
    dir <- unique(dirname(infiles))
    #
    #
    #
    outfiles <- file.path(dir, inputFile$name)
    #
    #
    #
    purrr:::walk2(infiles, outfiles, ~file.rename(.x, .y))
    #
    #
    #
    x <- try(readOGR(dir, strsplit(inputFile$name[1], "\\.")[[1]][1]), TRUE)
    #
    #
    #
    if(class(x) == "try-error") NULL 
    #
    #
    #
    else
    #
    # Transform shapefiles into WGS84 longlat
    #
    x <- spTransform(x = x, CRSobj = CRS(long.lat.crs))
  })

  #
  #
  #
  observeEvent(input$mapDraw1, {
      #
      #
      #
      leafletProxy("map.sampling") %>%
      #
      #
      #
      clearTiles() %>%
      #
      #
      #
      clearShapes() %>%
      #
      #
      #
      clearMarkers() %>%
      #
      #
      #
      addTiles(
        urlTemplate = mapbox.satellite,
        attribution = "Imagery by <a href='https://www.mapbox.com'>Mapbox</a>"
      ) %>%
      #
      #
      #
      fitBounds(lng1 = bbox(city.map())[1,1], 
                lat1 = bbox(city.map())[2,1], 
                lng2 = bbox(city.map())[1,2], 
                lat2 = bbox(city.map())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = city.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = FALSE),
		group = "Survey Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          position = "topleft",
          options = layersControlOptions(collapsed = FALSE)) %>%
        #
        # Keep baselayers at base of map
        #
        htmlwidgets::onRender("
          function(el, x) {
            this.on('baselayerchange', function(e) {
              e.layer.bringToBack();
            })
          }
        ")          		      
  })    
  #
  #
  #
  observeEvent(input$mapDraw2, {
      #
      #
      #
      leafletProxy("map.sampling") %>%
      #
      #
      #
      clearTiles() %>%
      #
      #
      #
      clearShapes() %>%
      #
      #
      #
      clearMarkers() %>%
      #
      #
      #
      addTiles(
        urlTemplate = mapbox.satellite,
        attribution = "Imagery by <a href='https://www.mapbox.com'>Mapbox</a>"
      ) %>%
      #
      #
      #
      #setView(lng = mean(coordinates(slum.map())[,1]), 
      #        lat = mean(coordinates(slum.map())[,2]), 
      #        zoom = 11) %>%
      fitBounds(lng1 = bbox(slum.map())[1,1], 
                lat1 = bbox(slum.map())[2,1], 
                lng2 = bbox(slum.map())[1,2], 
                lat2 = bbox(slum.map())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = slum.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = FALSE),
		group = "Slum Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Slum Areas"),
          position = "topleft",
          options = layersControlOptions(collapsed = FALSE)) %>%
        #
        # Keep baselayers at base of map
        #
        htmlwidgets::onRender("
          function(el, x) {
            this.on('baselayerchange', function(e) {
              e.layer.bringToBack();
            })
          }
        ")		      
  })
  #
  #
  #
  observeEvent(input$shp1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.city.area",
                      label = "Select map data identifier for city survey areas",
                      choices = names(city.map()))
  })
  #
  #
  #
  observeEvent(input$shp2, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.slum.area1",
                      label = "Select map data identifier for slum survey areas",
                      choices = names(slum.map()))
  })
  #
  #
  #
  observeEvent(input$list1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "var.slum.area2",
                      label = "Select map data identifier for slum survey areas",
                      choices = names(sample.list.df()))
  })
  #
  #
  #
  observeEvent(input$var.city.area, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "city.area.name",
                      label = "Select city area",
                      choices = levels(city.map()[[input$var.city.area]]))
  })
  #
  #
  #
  observeEvent(input$var.slum.area1, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "slum.area.name1",
                      label = "Select slum area",
                      choices = levels(slum.map()[[input$var.slum.area1]]))
  })
  #
  #
  #
  observeEvent(input$var.slum.area2, {
    #
    #
    #
    updateSelectInput(session = session,
                      inputId = "slum.area.name2",
                      label = "Select slum area",
                      choices = levels(sample.list.df()[[input$var.slum.area2]]))
  })
  #
  #
  #
  output$map.draw.control1 <- renderUI({
    #
    #
    #
    if(!is.null(input$shp1))
      {
      #
      #
      #
      actionButton(inputId = "mapDraw1",
                   label = "Map",
                   class = "btn-primary",
                   icon = icon(name = "map", class = "fa-lg"))
      }
  })
  #
  #
  #
  output$map.draw.control2 <- renderUI({
    #
    #
    #
    if(!is.null(input$shp2))
      {
      #
      #
      #
      actionButton(inputId = "mapDraw2",
                   label = "Map",
                   class = "btn-primary",                   
                   icon = icon(name = "map", class = "fa-lg"))
      }
  })
  #
  #
  #
  xGrid <- eventReactive(input$sample.city, {
	#
	# Subset to current survey area
	#
	temp <- subset(city.map(), get(input$var.city.area) == input$city.area.name)
	#
	# Grid current area
	#
	repeat
	  {
	  #
	  # Spatial sample
	  #
	  xSP <- spsample(x = temp, 
					  n = input$n.psu.citywide, 
					  type = "regular")
	  #
	  # Check if there are enough grids
	  #
	  if(length(xSP) == input$n.psu.citywide) break
	  }  
	  #
	  # Create identifiers
	  #
	  areaID    <- rep(input$city.area.name, length(xSP))
	  quadratID <- 1:length(xSP)
	  longitude <- xSP@coords[ , 1] 
	  latitude  <- xSP@coords[ , 2]
	  #
	  #
	  #
	  xGrid <- as(as(xSP, "SpatialPixels"), "SpatialPolygons")
	  #
	  #
	  #
	  xGrid <- SpatialPolygonsDataFrame(Sr = xGrid,
										data = data.frame(areaID, quadratID, longitude, latitude),
										match.ID = FALSE)
  })				
  #
  # 
  #
  output$city.grid.table <- DT::renderDataTable(DT::datatable({
	#
	#
    #
    xGrid()@data
  }))
  #
  #
  #
  output$city.download1 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("cityList", input$city.area.name, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(xGrid()@data, file)
    }
  )
  #
  #
  #
  output$download.city <- renderUI({
    #
    #
    #
    if(input$sample.city)
      #
      #
      #
      downloadButton(outputId = "city.download1",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
  #
  #
  #
  observeEvent(xGrid(), {
       #
       #
       #
       leafletProxy("map.sampling") %>%
       #
       #
       #
       clearShapes() %>%
       #
       #
       #
       clearMarkers() %>%
       #
       #
       #
       clearControls() %>%
       #
       #
       #
       #setView(lng = mean(coordinates(xGrid())[,1]), 
       #        lat = mean(coordinates(xGrid())[,2]), 
       #        zoom = 13) %>%
      fitBounds(lng1 = bbox(xGrid())[1,1], 
                lat1 = bbox(xGrid())[2,1], 
                lng2 = bbox(xGrid())[1,2], 
                lat2 = bbox(xGrid())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = city.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = TRUE),
		group = "Survey Areas") %>%
       #
       # Add survey area polygon layer
       #
	   addPolygons(
	     data = xGrid(),
	     weight = 3,
	     opacity = 1,
	     color = "blue",
	     dashArray = "",
	     fillOpacity = 0,
	     highlight = highlightOptions(
		   weight = 4,
		   color = "#666",
		   dashArray = "",
		   fillOpacity = 0,
		   bringToFront = TRUE),
		  group = paste(input$city.area.name, "grids", sep = " ")) %>%
		#
		#
		#
		addCircleMarkers(
		  data = xGrid(),
		  lng =  coordinates(xGrid())[,1],
		  lat = coordinates(xGrid())[,2],
		  radius = 1,
		  fill = TRUE,
		  fillColor = "red",
		  fillOpacity = 0.8,
		  color = "red",
		  group = paste(input$city.area.name, "sampling points", sep = " ")) %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          overlayGroups = c(paste(input$city.area.name, "grids", sep = " "), paste(input$city.area.name, "sampling points", sep = " ")),
          position = "topleft",
          options = layersControlOptions(collapsed = FALSE)) %>%
        #
        # Keep baselayers at base of map
        #
        htmlwidgets::onRender("
          function(el, x) {
            this.on('baselayerchange', function(e) {
              e.layer.bringToBack();
            })
          }
        ")          		      
  })         
  #
  #
  #
  sGrid <- eventReactive(input$sample.slum1, {
	#
	# Subset to current survey area
	#
	temp <- subset(slum.map(), get(input$var.slum.area1) == input$slum.area.name1)
	#
	# Grid current area
	#
	repeat
	  {
	  #
	  # Spatial sample
	  #
	  xSP <- spsample(x = temp, 
					  n = input$n.psu.slum, 
					  type = "regular")
	  #
	  # Check if there are enough grids
	  #
	  if(length(xSP) == input$n.psu.citywide) break
	  }  
	  #
	  # Create identifiers
	  #
	  areaID    <- rep(input$slum.area.name1, length(xSP))
	  quadratID <- 1:length(xSP)
	  longitude <- xSP@coords[ , 1] 
	  latitude  <- xSP@coords[ , 2]
	  #
	  #
	  #
	  sGrid <- as(as(xSP, "SpatialPixels"), "SpatialPolygons")
	  #
	  #
	  #
	  sGrid <- SpatialPolygonsDataFrame(Sr = sGrid,
										data = data.frame(areaID, quadratID, longitude, latitude),
										match.ID = FALSE)
  })				
  #
  # 
  #
  output$slum.grid.table <- DT::renderDataTable(DT::datatable({
	#
	#
    #
    sGrid()@data
  }))
  #
  #
  #
  output$slum.download1 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("slumList", input$slum.area.name1, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(sGrid()@data, file)
    }
  )
  #
  #
  #
  output$download.slum1 <- renderUI({
    #
    #
    #
    if(input$sample.slum1)
      #
      #
      #
      downloadButton(outputId = "slum.download1",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
  #
  #
  #
  observeEvent(sGrid(), {
       #
       #
       #
       leafletProxy("map.sampling") %>%
       #
       #
       #
       clearShapes() %>%
       #
       #
       #
       clearMarkers() %>%
       #
       #
       #
       clearControls() %>%
       #
       #
       #
       #setView(lng = mean(coordinates(sGrid())[,1]), 
       #        lat = mean(coordinates(sGrid())[,2]), 
       #        zoom = 13) %>%
      fitBounds(lng1 = bbox(sGrid())[1,1], 
                lat1 = bbox(sGrid())[2,1], 
                lng2 = bbox(sGrid())[1,2], 
                lat2 = bbox(sGrid())[2,2]) %>%
      #
      # Add survey area polygon layer
      #
	  addPolygons(
	    data = slum.map(),
	    weight = 2,
	    opacity = 1,
	    color = "yellow",
	    dashArray = "",
	    fillOpacity = 0,
	    highlight = highlightOptions(
		  weight = 4,
		  color = "#666",
		  dashArray = "",
		  fillOpacity = 0,
		  bringToFront = TRUE),
		group = "Survey Areas") %>%
       #
       # Add survey area polygon layer
       #
	   addPolygons(
	     data = sGrid(),
	     weight = 3,
	     opacity = 1,
	     color = "blue",
	     dashArray = "",
	     fillOpacity = 0,
	     highlight = highlightOptions(
		   weight = 4,
		   color = "#666",
		   dashArray = "",
		   fillOpacity = 0,
		   bringToFront = TRUE),
		  group = paste(input$slum.area.name1, "grids", sep = " ")) %>%
		#
		# Add centroids
		#
		addCircleMarkers(
		  data = sGrid(),
		  lng =  coordinates(sGrid())[,1],
		  lat = coordinates(sGrid())[,2],
		  radius = 1,
		  fill = TRUE,
		  fillColor = "red",
		  fillOpacity = 0.8,
		  color = "red",
		  group = paste(input$slum.area.name1, "sampling points", sep = " ")) %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          overlayGroups = c(paste(input$slum.area.name1, "grids", sep = " "), paste(input$slum.area.name1, "sampling points", sep = " ")),
          position = "topleft",
          options = layersControlOptions(collapsed = FALSE)) %>%		      
        #
        # Keep baselayers at base of map
        #
        htmlwidgets::onRender("
          function(el, x) {
            this.on('baselayerchange', function(e) {
              e.layer.bringToBack();
            })
          }
        ")
  })         
  #
  #
  #
  sample.list.df <- reactive({
    #
    #
    #
    inputFile <- input$list1
    #
    #
    #
    if(is.null(inputFile))
      {
      #
      #
      #
      return(NULL)
      }
    #
    #
    #
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })    
  #
  #
  #
  sample.slum.list <- eventReactive(input$sample.slum2, {
	  #
	  #
	  #
      temp <- subset(sample.list.df(), get(input$var.slum.area2) == input$slum.area.name2)
	  #
	  #
	  #
	  stepInterval <- floor(nrow(temp) / input$n.psu.slum)
      #
	  #
	  #
	  startPoint <- sample(x = 1:input$n.psu.slum, size = 1, replace = FALSE)
	  #
	  #
	  #
	  selectList <- seq(from = startPoint, to = nrow(temp), by = stepInterval)
	  #
	  #
	  #
	  sample.slum.list <- temp[selectList, ]
  })
  #
  #
  #
  output$sample.slum.table <- DT::renderDataTable(DT::datatable({
	#
	#
	#
	sample.slum.list()
  }))
  #
  #
  #
  output$slum.download2 <- downloadHandler(
    #
    #
    #
    filename = function() {
      #
      #
      #
      paste("slumList", input$slum.area.name2, ".csv", sep= "")
    },
    #
    #
    #
    content = function(file) {
      #
      #
      #
      write.csv(sample.slum.list(), file)
    }
  )
  #
  #
  #
  output$download.slum2 <- renderUI({
    #
    #
    #
    if(input$sample.slum2)
      #
      #
      #
      downloadButton(outputId = "slum.download2",
                     label = "Download",
                     class = "btn-primary",
                     icon = icon(name = "download", class = "fa-lg"))
  })
}