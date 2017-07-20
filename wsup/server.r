
################################################################################
#
# Server function
#
################################################################################
#
#
#
function(input, output, session) {
  #
  # Determine which country has been selected - set 1
  # 
  observe({
    #
    # Bangladesh
    #
    if(input$country1 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Dhaka" = "Dhaka"))
    #
    # Ghana
    #
    if(input$country1 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Accra" = "Accra"))    
    # 
    # Kenya
    #
    if(input$country1 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    # Madagascar
    #
    if(input$country1 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    # Mozambique
    #
    if(input$country1 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Maputo" = "Maputo"))
    #
    # Zambia
    #
    if(input$country1 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city1",
                        choices = c("Lusaka" = "Lusaka"))
  })
  #
  #
  #
  output$sideHeader1 <- reactive({
    #
    #
    #
    paste(input$city1, ", ", input$country1, sep = "")
  })
  #
  #
  #
  output$mainHeader1 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$z.demographics], sep = "")
  })
  #
  # Determine which country has been selected - set 2
  # 
  observe({
    #
    #
    #
    if(input$country2 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country2 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country2 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country2 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country2 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country2 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city2",
                        choices = c("Lusaka" = "Lusaka"))
  })  
  #
  #
  #
  output$sideHeader2 <- reactive({
    #
    #
    #
    paste(input$city2, ", ", input$country2, sep = "")
  })
  #
  #
  #
  output$mainHeader2 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$z.poverty], sep = "")
  })
  #
  # Determine which country has been selected - set 3
  # 
  observe({
    #
    #
    #
    if(input$country3 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country3 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country3 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country3 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country3 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country3 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city3",
                        choices = c("Lusaka" = "Lusaka"))
  })
  #
  #
  #
  output$sideHeader3 <- reactive({
    #
    #
    #
    paste(input$city3, ", ", input$country3, sep = "")
  })
  #
  #
  #
  output$mainHeader3 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$indicator.ladder], sep = "")
  })
  #
  #
  #
  output$mainHeader3a <- reactive({
    #
    #
    #
    if(input$z.ladder == "waterSet1") {paste("Drinking water service ladder", sep = "")}
    #
    #
    #
    else
    #
    #
    #
    if(input$z.ladder == "sanSet1")   {paste("Sanitation service ladder", sep = "")}
    #
    #
    #
    else
    #
    #
    #
    if(input$z.ladder == "handSet")   {paste("Handwashing service ladder", sep = "")}    
  })
  #
  # Determine which country has been selected - set 4
  # 
  observe({
    #
    #
    #
    if(input$country4 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country4 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country4 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country4 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country4 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country4 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city4",
                        choices = c("Lusaka" = "Lusaka"))
  })  
  #
  #
  #
  output$sideHeader4 <- reactive({
    #
    #
    #
    paste(input$city4, ", ", input$country4, sep = "")
  })
  #
  #
  #
  output$mainHeader4 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$z.water], sep = "")
  })
  #
  # Determine which country has been selected - set 5
  # 
  observe({
    #
    #
    #
    if(input$country5 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country5 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country5 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country5 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country5 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country5 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city5",
                        choices = c("Lusaka" = "Lusaka"))
  })
  #
  #
  #
  output$sideHeader5 <- reactive({
    #
    #
    #
    paste(input$city5, ", ", input$country5, sep = "")
  })
  #
  #
  #
  output$mainHeader5 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$z.sanitation], sep = "")
  })
  #
  # Determine which country has been selected - set 6
  # 
  observe({
    #
    #
    #
    if(input$country6 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country6 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country6 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country6 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country6 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country6 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city6",
                        choices = c("Lusaka" = "Lusaka"))
  })
  #
  #
  #
  output$sideHeader6 <- reactive({
    #
    #
    #
    paste(input$city6, ", ", input$country6, sep = "")
  })
  #
  #
  #
  output$mainHeader6 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$z.hygiene], sep = "")
  })
  #
  # Determine which country has been selected - set 7
  # 
  observe({
    #
    #
    #
    if(input$country7 == "Bangladesh")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Dhaka" = "Dhaka"))
    #
    #
    #
    if(input$country7 == "Ghana")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Accra" = "Accra"))    
    # 
    #
    #
    if(input$country7 == "Kenya")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Nakuru" = "Nakuru"))    
    #
    #
    #
    if(input$country7 == "Madagascar")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Antananarivo" = "Antananarivo"))    
    #
    #
    #
    if(input$country7 == "Mozambique")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Maputo" = "Maputo"))
    #
    #
    #
    if(input$country7 == "Zambia")
      #
      #
      #
      updateSelectInput(session,
                        inputId = "city7",
                        choices = c("Lusaka" = "Lusaka"))
  })
  #
  #
  #
  output$sideHeader7 <- reactive({
    #
    #
    #
    paste(input$city7, ", ", input$country7, sep = "")
  })
  #
  #
  #
  output$mainHeader7 <- reactive({
    #
    #
    #
    paste("Indicator: ", steerIndicators$varNames[steerIndicators$varList == input$indicator.overall], sep = "")
  })


################################################################################
#
# Modal dialog
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
                           title = "Guide to demographics indicators",
                           size = "l",
                           HTML("
                             <h5>Mean number of household members</h5>
                             <p>This indicator is based on the self-report of number of household members. This indicator was estimated using a blocked weighted bootstrap estimator implemented using <a href='https://cran.r-project.org' target='_blank'>R</a> language for statistical computing. The raw indicator data is used to draw a histogram to illustrate the distribution of the indicator value with the peak of the histogram representing the mean number of household members.   
                           ")))
                           
  })
  #
  #
  #
  observeEvent(input$info11, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Demographihcs charts specifications",
                           size = "l",
                           HTML("
                             <h5>Stratify by</h5>
                             <p>Select from choices of data variables to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <p><code>All Data (No Stratification)</code> is selected by default</p>
                             <h5>Select bin width</h5>
                             <p>Select indicator data value interval to divide the dataset with. For example, for a dataset of percentages with values ranging between 0 and 100, a <code>bin width</code> of <code>5</code> would mean equal interval grouping of data by 5 such as <code>[0,5)</code>, <code>[5, 10)</code>, <code>[10,15)</code>...<code>[95,100]</code>. <code>Bin width</code> of <code>1</code> is selected by default</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info12, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Demographihcs map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })                        
  #
  #
  #
  observeEvent(input$info13, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Demographihcs table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>ccode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>zone</code> - character values corresponding to the survey areas.</li>
                               <li><code>type</code> - character values for type of area; two possible values - <code>slum</code> and <code>citywide</code>.</li>
                               <li><code>nMembers</code> - numeric values for number of household members.</li>
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
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
                           title = "Guide to poverty indicators",
                           size = "l",
                           HTML("
                             <h5>Progress out of Poverty Index (PPI)</h5>
                             <p>The <code>Progress out of Poverty Index (PPI)</code> is a measure of poverty developed by <a href='http://www.grameenfoundation.org' target='_blank'>Grameen Foundation</a> in collaboration with the <a href='https://www.fordfoundation.org' target='_blank'>Ford Foundation</a>, and managed by the <a href'http://www.poverty-action.org' target='_blank'>Innovations for Poverty Action</a>. The first <code>PPI</code> was released in 2006 and has since then been customised for 45 countries. The <code>PPI</code> is based on a country-specific 10-item questionnaire about a household’s characteristics and asset ownership which is scored to compute the likelihood that a household is living below country-specific and universal poverty line thresholds.</p>
                             <h5>Poverty Likelihood ($1.25 a day)</h5>
                             <p>This is the measure of the probability that a household is below the <code>$1.25 purchasing power parity (PPP)</code> poverty threshold of 2005. The likelihood is determined through pre-calculated and country-specific probabilites based on the household <code>PPI</code>. Other <code>PPI</code>-based poverty likelihoods using other country-specific and or global poverty thresholds are available.</p> 
                             <h5>Wealth Quintile</h5>
                             <p>This is the classification or grouping of each household into quintiles based on <code>PPI</code> with those in the lowest quintile (wealth quintile 1) having the lowest fifth <code>PPI</code> and those in the highest quintile (wealth quintile 5) having the highest fifth <code>PPI</code>.</p>
                             </ul>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info21, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Poverty charts specifications",
                           size = "l",
                           HTML("
                             <h5>Stratify by</h5>
                             <p>Select from choices of data variables to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select bin width</h5>
                             <p>Select indicator data value interval to divide the dataset with. For example, for a dataset of percentages with values ranging between 0 and 100, a <code>bin width</code> of 5 would mean equal interval grouping of data by 5 such as <code>[0,5)</code>, <code>[5, 10)</code>, <code>[10,15)</code>...<code>[95,100].</code></p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info22, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Poverty map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })                        
  #
  #
  #
  observeEvent(input$info23, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Poverty table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
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
                           title = "Guide to service ladder indicators",
                           size = "l",
                           HTML("
                             <h5>Drinking Water Service Ladder</h5>
                             
                             <p><strong>Safely managed:</strong> Drinking water from an improved water source which is located on premises, available when needed and free of faecal and priority contamination. </p>
                             <p><strong>Basic:</strong> Drinking water from an improved source provided collection time is not more than 30 minutes for a roundtrip including queuing.</p> 
                             <p><strong>Limited:</strong> Drinking water from an improved source where collection time exceeds over 30 minutes for a roundtrip to collect water, including queuing.</p>
                             <p><strong>Unimproved:</strong> Drinking water from an unimproved dug well or unprotected spring</p>
                             <p><strong>Surface water:</strong> Drinking water directly from a river, dam, lake, pond, stream, canal or irrigation channel.</p>
                             
                             <br/>
                             
                             <h5>Sanitation Service Ladder</h4>
                             
                             <p><strong>Safely managed:</strong> Use of an improved sanitation facility which is not shared with other households and where excreta are safely disposed in situ or transported and treated off-site.</p>
                             <p><strong>Basic:</strong> Use of improved facilities which are not shared with other households.</p>
                             <p><strong>Limited:</strong> Use of improved facilities shared between two or more households.</p>
                             <p><strong>Unimproved:</strong> Use of pit latrines wihtout a slab or platform, hanging latrines and bucket latrines</p>
                             <p><strong>Open defecation:</strong> Disposal of human faeces in fields, forest, bushes, open bodies of water, beaches or other open spaces or with solid waste.</p>
                             
                             <br/>
                             
                             <h5>Handwashing Service Ladder</h5>
                             
                             <p><strong>Basic:</strong> Hand washing facility with soap and water in the household.</p>
                             <p><strong>Limited:</strong> Handwashing facility without soap or water</p>
                             <p><strong>No facility:</strong> No handwashing facility</p>
                             
                           ")))
  })
  #
  #
  #
  observeEvent(input$info31, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Service ladder charts specifications",
                           size = "l",
                           HTML("
                             <h5>Select primary stratification</h5>
                             <p>Select from choices of data variables the primary factor to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select secondary stratification</h5>
                             <p>Select from choices of data variables the secondary factor to be used for grouping / disaggregating the data. When applied to charts, \\(m\\) unique values of the secondary stratifier variable are used to create \\(n \\times m\\) facets or panels of the resulting chart.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info32, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Service ladder map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info33, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Service ladder table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
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
                           title = "Guide to other water indicators",
                           size = "l",
                           HTML("
                             <h5>Access to sufficient and sustained drinking water</h4>
                             <p><strong>Percentage of households with access to sufficient and sustained drinking water</strong>: Sufficient is defined as <code>>50 litres per person per day</code>. Sustained is defined as drinking water available <code>24 hours per day</code>, <code>7 days a week</code> and <code>throughout the year</code>.</p>
                             
                             <br/>
                             
                             <h5>Access to safe and acceptable drinking water for all</h4>
                             
                             <p><strong>Percentage of households with good self-reported quality of drinking water:</strong> No objective water quality assessment was performed during the survey. This indicator, as stated, is based on self-reported perception of water quality.</p>
                             <p><strong>Percentage of households that are safely storing drinking water:</strong> Safe storage is defined as drinking water stored in a clean container with lid only.</p>
     
                             <br/>
                             
                             <h5>Access to affordable drinking water</h5>
                             <p><strong>Mean expenditure in drinking water by wealth quintile:</strong> mean expenditure in drinking water per household per year by wealth quintile. It should be noted that expenditure alone does not indicate affordable access to drinking water. The ideal and recommened indicator is yearly expenditure on water as a fraction of annual income i.e., \\(\\frac{\\mu_\\text{Household yearly expenditure on water}}{\\text{Household annual income}}\\). However, the surveys did not collect data on household income hence this recommended indicator cannot be calculated.</p>
                             
                             <br/>
                             
                             <h5>Physical access to drinking water</h5>                             
                             <p><strong>Percentage of households with adequate physical access to drinking water:</strong> Adequate physical access is defined as source of drinking water is located within <code>30 minutes</code> from home</p>
                             
                             <br>
                             
                             <h5>Formal water service provision</h5>
                             <p><strong>Percentage of households with formal drinking water service provision:</strong> Formal drinking water service provision is defined as drinking water provided by a formal service according to interviewer asessment.</p>
                             <p><strong>Percentage of households relying on formal provider for service supply maintenance:</strong> Formal provider for service supply maintenance is defined as a household with a formal service provider contact person in case of problems with water supply.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info41, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Water charts specifications",
                           size = "l",
                           HTML("
                             <h5>Select primary stratification</h5>
                             <p>Select from choices of data variables the primary factor to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select secondary stratification</h5>
                             <p>Select from choices of data variables the secondary factor to be used for grouping / disaggregating the data. When applied to charts, \\(m\\) unique values of the secondary stratifier variable are used to create \\(n \\times m\\) facets or panels of the resulting chart.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info42, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Water map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info43, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Water table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
                           "),
                           easyClose = TRUE,
                           footer = h5("Press ESC or click outside box to close")))
  })
  #
  #
  #
  observeEvent(input$info5, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Guide to other sanitation indicators",
                           HTML("
                             <h5>Adequate sanitaition facility</h4>
                             <p><strong>Percentage of households with adequate sanitation facilities</strong>: Adequate sanitation facility is defined as a system which hygienically separates excreta from human contact as well as safe reuse/treatment of excreta in situ, or safe transport and treatment off-site (flush to sewer system, septic tank or pit)</p>
                                                          
                             <h5>Individual-based equitable access to sanitation facilities</h4>
                             <p><strong>Percentage of households in which every member is able to use and actually use the sanitation facilites:</strong> This indicator is defined as all household members are able to use the facilities and all household members actually use the facilities.</p>
     
                             
                             <h5>Physically accessible sanitation facilities</h5>
                             <p><strong>Percentage of households with adequate physicall access to sanitation facilities:</strong> Adequate physical access is defined as a sanitation facility within < 30 minutes walking time from home.</p>
                             
                             
                             <h5>Access to affordable sanitation facilities</h5>                             
                             <p><strong>Mean expenditure in sanitation services:</strong> mean expenditure in sanitation per household per year by wealth quintile. It should be noted that expenditure alone does not indicate affordable access to sanitation services. The ideal and recommened indicator is yearly expenditure on sanitation as a fraction of annual income i.e., \\(\\frac{\\mu_\\text{Household yearly expenditure on sanitation}}{\\text{Household annual income}}\\). However, the surveys did not collect data on household income hence this recommended indicator cannot be calculated.</p>
                             
                             <h5>Acceptable sanitation facilities</h5>                             
                             <p><strong>Percentage of households with acceptable sanitation facilities:</strong> Acceptable sanitation facility is defined as sanitation facilities that are appropriate and sensitive to gender, lifecycle and privacy. This requires that the sanitation facility:</p>
                             <ul>
                               <li>is adequate (as previously defined)</li>
                               <li>has a lockable door</li>
                               <li>has electric light</li>
                               <li>has a water point</li>
                               <li>has a container for menstrual hygiene management</li>
                             </ul>

                             <h5>Sanitary disposal of child faeces</h5>
                             <p><strong>Percentage of households who practice sanitary disposal of child faeces:</strong> Sanitary dispoal of child faeces either with child using sanitation facility himself/herself or with faeces washed/rinsed into sanitaiton facility</p>
                                                          
                             <h5>Formal sanitation service provision</h5>
                             <p><strong>Percentage of households relying on formal operators to maintain facilities:</strong> Households contact facility operator to fix problems with sanitation facility.</p>
                             <p><strong>Percentage of households relying on formal pit emptier:</strong> Formal businesses are in charge of emptying the pit/ septic tank</p>                             
                           ")))
  })
  #
  #
  #
  observeEvent(input$info51, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Sanitation chart specifications",
                           size = "l", 
                           HTML("
                             <h5>Select primary stratification</h5>
                             <p>Select from choices of data variables the primary factor to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select secondary stratification</h5>
                             <p>Select from choices of data variables the secondary factor to be used for grouping / disaggregating the data. When applied to charts, \\(m\\) unique values of the secondary stratifier variable are used to create \\(n \\times m\\) facets or panels of the resulting chart.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info52, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Sanitation map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info53, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Sanitation table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info6, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Guide to other hygiene indicators",
                           size = "l",
                           HTML("
                             <h5>Use of adequate hygienic materials for menstrual hygiene management</h4>
                             <p><strong>Percentage of households using adequate hygienic materials foe MHM</strong>: Adequate hygienic maetrials are cloths, pads, tampons or menstrual cups</p>
                                                          
                             <h5>Hygienic and adequate disposal of menstrual hygiene materials</h4>
                             <p><strong>Percentage of households practicing good mentrual hygiene practies/behaviour:</strong> Good menstrual hygiene management includes cloths washed with soap and water and napkins/pads disposed of in the rubbish bin.</p>
     
                             
                             <h5>Comfort with sanitation facilities during menstruation</h5>
                             <p><strong>Percentage of households in which women and girls are comfortable using sanitation facility during menstruation:</strong></p>                             
                           ")))
  })
  #
  #
  #
  observeEvent(input$info61, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene chart specifications",
                           size = "l",
                           HTML("
                             <h5>Select primary stratification</h5>
                             <p>Select from choices of data variables the primary factor to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select secondary stratification</h5>
                             <p>Select from choices of data variables the secondary factor to be used for grouping / disaggregating the data. When applied to charts, \\(m\\) unique values of the secondary stratifier variable are used to create \\(n \\times m\\) facets or panels of the resulting chart.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info62, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info63, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info7, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Guide to overall indicators",
                           size = "l",
                           HTML("
                             <h5>Overall access to adequate water and sanitation services</h5>
                             <p><strong>Percentage of Households with access to adequate water and sanitation services by quintile</strong>: Adequate water services and adequate sanitation services as defined.</p>
                             <ul>
                               <li>Percentage of households with access to adequate sanitation and adequate drinking water</li>
                               <li>Percentage of households with access to adequate sanitation only</li>
                               <li>Percentage of households with access to adequate drinking water only</li>
                               <li>Percentage of households with no access to adequate services</li>
                             </ul>                                                     
                           ")))
  })
  #
  #
  #
  observeEvent(input$info71, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene chart specifications",
                           size = "l",
                           HTML("
                             <h5>Select primary stratification</h5>
                             <p>Select from choices of data variables the primary factor to be used for grouping / disaggregating the data. When applied to charts, \\(n\\) unique values of the selected variables are used to create \\(n\\) facets or panels of the resulting chart.</p>
                             <ul>
                               <li><code>All Data (No Stratification)</code>: full dataset is used and resulting chart has no facets or panels.</li>
                               <li><code>Survey Area</code>: dataset is grouped into \\(n\\) unique survey areas and resulting chart has \\(n\\) facets or panels corresponding to each survey area.</li>
                               <li><code>Area Type</code>: dataset is grouped into <code>slum</code> and <code>citywide</code> area types and resulting chart has <code>slum</code> and <code>citywide</code> facets or panels.</li>
                               <li><code>Wealth Quintile</code>: dataset is grouped into quintiles based on the <code>Progress out of Poverty Index (PPI)</code>.</li>
                             </ul>
                             <h5>Select secondary stratification</h5>
                             <p>Select from choices of data variables the secondary factor to be used for grouping / disaggregating the data. When applied to charts, \\(m\\) unique values of the secondary stratifier variable are used to create \\(n \\times m\\) facets or panels of the resulting chart.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info72, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene map specifications",
                           size = "l",
                           HTML("
                             <h5>Select colour palette</h5>
                             <p>Select from choices of colour palettes to use for mapping. Two categories of colour palettes are available.</p>
                             <ul>
                               <li><code>Sequential</code> palettes are suited to ordered data that progress from low to high with light colours representing low data values and dark colours representing high data values.</li>
                               <li><code>Diverging</code> palettes put equal emphasis on mid-range critical values and extremes at both ends of the data range. The middle values are emphasised with light colours and low and high extremes are emphasised with dark colours that have contrasting hues.</li>
                             </ul>
                             <p>The choices of colour palettes are based on <a href='http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3' target='_blank'>ColorBrewer 2.0</a> and implemented in R using the <a href='https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf' target='_blank'>RColorBrewer</a> function.</p>
                             <p>The default colour palette for the <code>Demographics</code> indicator set is <code>sequential yellow to orange to brown (YlOrBb)</code> scheme.</p>
                             <h5>Select colour mapping method</h5>
                             <p>Colour mapping methods determine how to match the indicator dataset to the selected colour palette appropriately. Three colour mapping methods are available.</p>
                             <ul>
                               <li><code>Linear interpolation</code> is a simple linear mapping from continuous numeric data to an interpolated colour palette. In this method, the selected colour palette is extended (via interpolation) to create a continuous set of colours consistent with the scheme that would be enough to match the range of values of the continuous numeric data being mapped.</li>
                               <li><code>Equal interval</code> maps continuous numeric data to a fixed number of colours from the palette. The continous indicator values are divided into equal interval group sets determined by the <code>number of bins</code> specified (see below regarding bins). The number of colours correspond to the <code>number of bins</code> into which the indicator values have been divided into.</li>
                               <li><code>Quantile</code> also maps continuous numeric data to a fixed number of colours from the palette. However, the continuous indicator values are divided into <code>quantiles</code> (group sets with equal number of observations). The number of colours correspond to the <code>number of quantiles</code> into which the indicator values have been divided into.</li> 
                             </ul>
                             <h5>Number of bins</h5>
                             <p><em>For equal interval method.</em> Select number of equal interval groups to divide the dataset into. For example, for a dataset of percentages with values ranging between 0 and 100, specifying <code>number of bins</code> to 5 would mean creating 5 equal interval groupings - <code>[0,20)</code>, <code>[20, 40)</code>, <code>[40,60)</code>, <code>[60,80)</code>, <code>[80,100]</code></p>
                             <h5>Number of classes</h5>
                             <p><em>For quantile method.</em> Select number of quantiles to divide dataset into.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info73, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Hygiene table specifications",
                           size = "l",
                           HTML("
                             <h5>Data variables</h5>
                             <p>The following variables are shown in the data table.</p>
                             <ul>
                               <li><code>country</code> - name of country from which data has been collected from.</li>
                               <li><code>countryCode</code> - the corresponding <code>ISO3166-1</code> three letter country code.</li>
                               <li><code>indicatorName</code> - string variable describing the indicator.</li>
                               <li><code>indicatorCode</code> - string variable for short code of indicators.</li>
                               <li><code>indicatorCategory</code> - string variable for category of indicators or the indicator set to which the indicators belong to.</li>
                               <li><code>strata</code> - variable containing various factors by which data can be stratified. These factors include <code>survey area</code> and <code>wealth quintile</code>.</li>
                               <li><code>estimate</code> - numeric values for indicator estimates.</li>
                               <li><code>lcl</code> - numeric values for the <code>lower 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>ucl</code> - numeric values for the <code>upper 95% confidence interval</code> of the indicator estimates.</li>
                               <li><code>type</code> - character values for survey area type (i.e., <code>slum</code> and <code>citywide</code>)</li> 
                             </ul>
                             <h5>Survey area</h5>
                             <p>Filter data by survey area. Select survey area/s to show in the data table. Default shows data for all survey areas.</p>
                             <h5>Slum/Citywide</h5>
                             <p>Filter data by area type. Select whether to show slum or citywide data. Default shows data for all area types.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info91, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "City map data input",
                           size = "l",
                           HTML("
                             <h5>Upload map of citywide survey area</h5>
                             <p>The map should be in ESRI Shapefile format (SHP). This file format requires a minimum of 3 related files in order to be readable. These files are the <code>.SHP</code>, <code>.SHX</code> and <code>.DBF</code>. Hence, these three files should be uploaded all at the same time by clicking on CTRL and then selecting at least the three files for upload. A warning will pop out if the incorrect file formats and/or incomplete number of files are uploaded. Once the files have been uploaded, two new options come out. First, the app asks for the vaiable name in the map files that contains the stratifying variable. This would be the variable name of a geographic subdivision by which you decided to divide the city. Second, a prompt for the number of primary sampilng units or <code>PSU</code> comes to view. This is set at a default of 30. Once you have specified these parameters, you can click on <code>Sample</code> and corresponding sampling maps will be produced on the main panel and corresponding sampling lists on the appropriate sampling tabs.</p>
                           ")))
  })
  #
  #
  #
  observeEvent(input$info92, {
     #
     #
     #
     showModal(modalDialog(withMathJax(),
                           title = "Slum map data input",
                           size = "l",
                           HTML("
                             <h5>Available slum area sampling information</h5>
                             <p>For slum areas, you are first asked what information you have on slums that can be used for sampling: <code>slum maps</code> or <code>slum lists</code>. If you have slum maps, then you are given the options for sampling with slum maps (below). If you have lists, then you are given the option for sampling with slum lists (below).</p>
                             
                             <h5>Upload map of slum survey area</h5>
                             <p>The map should be in ESRI Shapefile format (SHP). This file format requires a minimum of 3 related files in order to be readable. These files are the <code>.SHP</code>, <code>.SHX</code> and <code>.DBF</code>. Hence, these three files should be uploaded all at the same time by clicking on CTRL and then selecting at least the three files for upload. A warning will pop out if the incorrect file formats and/or incomplete number of files are uploaded. Once the files have been uploaded, two new options come out. First, the app asks for the vaiable name in the map files that contains the stratifying variable. This would be the variable name of a geographic subdivision by which you decided to divide the city. Second, a prompt for the number of primary sampilng units or <code>PSU</code> comes to view. This is set at a default of 30. Once you have specified these parameters, you can click on <code>Sample</code> and corresponding sampling maps will be produced on the main panel and corresponding sampling lists on the appropriate sampling tabs.</p>

                             <h5>Upload list of slum areas</h5>
                             <p>The list of slum areas should be in CSV format. The list should be organised and sorted along the stratifying variable for survey areas. Once the list has been uploaded, you will need to specify how many <code>PSUs</code> will be survyed. Then press on <code>Sample</code>. A sample list from the complete list is now available on the <code>Slum Lists</code> tab.</p>
                           ")))
  })


################################################################################
#
# Dynamic UI
#
################################################################################
  #
  # Update choices
  #
  observe({
      #
      #
      #
      if(input$x.ladder == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Area Type" = "type"))
      #
      #
      #
      if(input$x.ladder == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.ladder == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.ladder",
                          label = "Select Secondary Stratification",
                          choices = c(None = "."))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.overall == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Area Type" = "type"))
      #
      #
      #
      if(input$x.overall == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = ".", 
                                      "Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.overall == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.overall",
                          label = "Select Secondary Stratification",
                          choices = c(None = "."))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.water == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.water == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.water == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.water",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.sanitation == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.sanitation == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c("Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.sanitation == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.sanitation",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$x.hygiene == 'surveyArea')
        #
        #
        # 
        updateSelectInput(session, 
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))
      #
      #
      #
      if(input$x.hygiene == "type")
        #
        #
        #
        updateSelectInput(session, 
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Survey Area" = "surveyArea"))
      #
      #
      #
      if(input$x.hygiene == "wealth")
        #
        #
        #
        updateSelectInput(session,
                          inputId = "y.hygiene",
                          label = "Select Secondary Stratification",
                          choices = c("Area Type" = "type"))  
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$z.poverty == "ppp125")
        #
        #
        #
        updateSliderInput(session = session,
                          inputId = "bins.poverty",
                          label = "Select bin width",
                          value = 0.1, step = 0.1,
                          min = 0.1, max = 1)
      #
      #
      #
      if(input$z.poverty != "ppp125")
        #
        #
        #
        updateSliderInput(session = session,
                          inputId = "bins.poverty",
                          label = "Select bin width",
                          value = 1, step = 1,
                          min = 1, max = 5)
      })
  #
  #
  #
  observe({
      #
      #
      #
      if(input$z.ladder == "waterSet1")
        #
        #
        #
        updateSelectInput(session = session,
                          inputId = "indicator.ladder",
                          label = "Select indicator",
                          choices = list("Surface water" = "jmpWater1",
                                         "Unimproved" = "jmpWater2",
                                         "Limited" = "jmpWater3",
                                         "Basic" = "jmpWater4",
                                         "Safely-managed" = "jmpWater5"),
                          selected = "jmpWater1")
    #
    #
    #
    if(input$z.ladder == "sanSet1")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "indicator.ladder",
                        label = "Select indicator", 
                        choices = list("Open defecation" = "jmpSan1",
                                       "Unimproved" = "jmpSan2",
                                       "Limited" = "jmpSan3",
                                       "Basic" = "jmpSan4",
                                       "Safely-managed" = "jmpSan5"),
                        selected = "jmpSan1")
    #
    #
    #
    if(input$z.ladder == "handSet")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "indicator.ladder",
                        label = "Select indicator",
                        choices = list("No facility" = "jmpHand1",
                                       "Limited" = "jmpHand2",
                                       "Basic" = "jmpHand3"),
                        selected = "jmpHand1")
  })
  #
  #
  #
  output$map.bins.demographics.control <- renderUI({
    #
    # UI if map.colour.demographics == "interval"
    #
    if(input$map.colour.demographics == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.demographics",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.demographics.control <- renderUI({
    #
    # UI if map.colour.demographics == "quantile" 
    #
    if(input$map.colour.demographics == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.demographics",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.poverty.control <- renderUI({
    #
    # UI if map.colour.poverty == "interval"
    #
    if(input$map.colour.poverty == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.poverty",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.poverty.control <- renderUI({
    #
    # UI if map.colour.poverty == "quantile" 
    #
    if(input$map.colour.poverty == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.poverty",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.ladder.control <- renderUI({
    #
    # UI if map.colour.ladder == "interval"
    #
    if(input$map.colour.ladder == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.ladder",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.ladder.control <- renderUI({
    #
    # UI if map.colour.ladder == "quantile" 
    #
    if(input$map.colour.ladder == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.ladder",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.water.control <- renderUI({
    #
    # UI if map.colour.water == "interval"
    #
    if(input$map.colour.water == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.water",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.water.control <- renderUI({
    #
    # UI if map.colour.water == "quantile" 
    #
    if(input$map.colour.water == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.water",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.sanitation.control <- renderUI({
    #
    # UI if map.colour.sanitation == "interval"
    #
    if(input$map.colour.sanitation == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.sanitation",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.sanitation.control <- renderUI({
    #
    # UI if map.colour.sanitation == "quantile" 
    #
    if(input$map.colour.sanitation == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.sanitation",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.hygiene.control <- renderUI({
    #
    # UI if map.colour.hygiene == "interval"
    #
    if(input$map.colour.hygiene == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.hygiene",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.hygiene.control <- renderUI({
    #
    # UI if map.colour.hygiene == "quantile" 
    #
    if(input$map.colour.hygiene == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.hygiene",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  output$map.bins.overall.control <- renderUI({
    #
    # UI if map.colour.overall == "interval"
    #
    if(input$map.colour.overall == "interval")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.bins.overall",
                  label = "Number of classes",
                  min = 3, max = 7, value = 5, step = 1)
  })
  #
  #
  #
  output$map.quantile.overall.control <- renderUI({
    #
    # UI if map.colour.overall == "quantile" 
    #
    if(input$map.colour.overall == "quantile")
      #
      # Create slider input control
      #
      sliderInput(inputId = "map.n.overall",
                  label = "Number of quantiles",
                  min = 3, max = 7, value = 5, step = 1)      
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.demographics",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.demographics",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.poverty",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.poverty",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.water",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.water",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                                       
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$indicator.ladder]], city.results.sp[[input$indicator.ladder]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.ladder",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.ladder",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.sanitation",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.sanitation",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$z.hygiene]], city.results.sp[[input$z.hygiene]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.hygiene",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.hygiene",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })
  #
  #
  #
  observe({   
    #
    #
    #
    yy <- c(slum.results.sp[[input$indicator.overall]], city.results.sp[[input$indicator.overall]])
    xx <- try(cut(yy, breaks = quantile(yy, probs = c(0.2, 0.4, 0.6, 0.8, 1))), silent = TRUE)
    #
    #
    #
    if(class(xx) == "try-error")
      #
      #
      #
      updateSelectInput(session = session,
                        inputId = "map.colour.overall",
                        label = "Select colour mapping method",
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
                        inputId = "map.colour.overall",
                        label = "Select colour mapping method",
                        choices = list("Linear" = "linear",
                                       "Equal interval" = "interval",
                                       "Quantile" = "quantile"),
                        selected = "interval")
  })                 


################################################################################
#
# Get data
#
################################################################################
  #
  # Get data for histograms for nMembers
  #
  indicatorsDataset <- reactive({
    #
    # Subset to selected country
    #
    indicatorsDF[indicatorsDF$country1 == input$country1, ]        
    })
  #
  # Get data for service ladders - survey area
  #
  area.ladder <- reactive({
    #
    #
    #
    areaResultsLong[areaResultsLong$country == input$country3 & areaResultsLong$indicatorCategory == input$z.ladder, ]
    })
  #
  # Get data for service ladders - wealth
  #
  wealth.ladder <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country3 & wealthResultsLong$indicatorCategory == input$z.ladder, ]        
    })
  #
  # Get data for poverty - survey area
  #
  area.poverty <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country2 & areaResultsLong$indicatorCategory == input$z.poverty, ]
    })
  #
  # Get data for poverty - wealth
  #
  wealth.poverty <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country2 & wealthResultsLong$indicatorCategory == input$z.poverty, ]        
    })
  #
  # Get data for overall - survey area
  #
  area.overall <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country7 & areaResultsLong$indicatorCategory == input$z.overall, ]
    })
  #
  # Get data for poverty - wealth
  #
  wealth.overall <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country7 & wealthResultsLong$indicatorCategory == input$z.overall, ]        
    })
  #
  # Get data for water - survey area
  #
  area.water <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country4 & areaResultsLong$indicatorCode == input$z.water, ]
    })
  #
  # Get data for water - wealth
  #
  wealth.water <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country4 & wealthResultsLong$indicatorCode == input$z.water, ]        
    })
  #
  # Get data for sanitation - survey area
  #
  area.sanitation <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country5 & areaResultsLong$indicatorCode == input$z.sanitation, ]
    })
  #
  # Get data for sanitation - wealth
  #
  wealth.sanitation <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country5 & wealthResultsLong$indicatorCode == input$z.sanitation, ]        
    })
   #
  # Get data for hygiene - survey area
  #
  area.hygiene <- reactive({
    #
    #
    #   
    areaResultsLong[areaResultsLong$country == input$country6 & areaResultsLong$indicatorCode == input$z.hygiene, ]
    })
  #
  # Get data for hygiene - wealth
  #
  wealth.hygiene <- reactive({
    #
    #
    #
    wealthResultsLong[wealthResultsLong$country == input$country6 & wealthResultsLong$indicatorCode == input$z.hygiene, ]        
    })
    
    
################################################################################
#
#
#
# Plot indicator charts
#
#
#
################################################################################
 
################################################################################
#
# Plot Demographics
#
################################################################################
  #
  # Demographics
  #
  output$demographics <- renderPlot({
    #
    # Create ggplot mapping base
    #
    baseHist <- ggplot(data = indicatorsDF, mapping = aes(x = nMembers))
    #
    # Layers
    #
    histPlot <- geom_histogram(binwidth = input$bins.demographics, color = wsupColour, fill = wsupColour, alpha = 0.6)
    #
    #
    #
    allPlot <- baseHist + histPlot + theme_wsup + labs(x = "Number of Household Members", y = "")
    #
    #
    #
    if(input$x.demographics == "zone")
      #
      #
      #
      facet.demo <- facet_wrap( ~ zone, labeller = labeller(zone = addArea))
    #
    #
    #
    if(input$x.demographics == "type")
      #
      #
      #
      facet.demo <- facet_wrap( ~ type)
    #
    #
    #
    if(input$x.demographics == "pQuintile")
      #
      #
      #
      facet.demo <- facet_wrap( ~ pQuintile, labeller = labeller(pQuintile = addWealth))    
    #
    #
    #
    if(input$x.demographics != ".")
      #
      #
      #
      allPlot <- allPlot + facet.demo
    #
    #
    #
    print(allPlot)
  #
  #
  #
  }, height = 500)



################################################################################
#
# Plot Poverty
#
################################################################################
  #
  # Poverty
  #
  output$poverty <- renderPlot({
    #
    # Create ggplot mapping base
    #
    basePoverty <- ggplot(data = indicatorsDF, mapping = aes(x = get(input$z.poverty)))
    #
    # Layers
    #
    povertyPlot <- geom_histogram(binwidth = input$bins.poverty, 
                                  color = wsupColour, 
                                  fill = wsupColour, 
                                  alpha = 0.6)
    #
    #
    #
    labs <- ifelse(input$z.poverty == "ppi", "PPI Score",
              ifelse(input$z.poverty == "ppp125", "Poverty Likelihood ($1.25 a day)", "Wealth Quintile")) 
    #
    #
    #
    allPlot <- basePoverty + povertyPlot + theme_wsup + labs(x = labs, y = "")
    #
    #
    #
    if(input$x.poverty == "zone")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ zone, labeller = labeller(zone = addArea))
    #
    #
    #
    if(input$x.poverty == "type")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ type)
    #
    #
    #
    if(input$x.poverty == "pQuintile")
      #
      #
      #
      facet.poverty <- facet_wrap( ~ pQuintile, labeller = labeller(pQuintile = addWealth))    
    #
    #
    #
    if(input$x.poverty != ".")
      #
      #
      #
      allPlot <- allPlot + facet.poverty
    #
    #
    #
    print(allPlot)
  #
  #
  #
  }, height = 500)


################################################################################
#
# Plot Service Ladders
#
################################################################################
  #
  # 
  #
  output$ladder <- renderPlot({
    #
    #
    #
    if(input$x.ladder == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.ladder(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))
    #
    #
    #
    if(input$x.ladder == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.ladder(),
                         mapping = aes_string(x = input$x.ladder,
                                              y = "estimate",
                                              fill = "indicatorCode"))    
    #
    #
    #
    if(input$x.ladder == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.ladder(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", position = "fill", alpha = 0.8)
    #
    #
    #
    if(input$z.ladder == "waterSet1")
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
    if(input$z.ladder == "sanSet1")
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
    if(input$z.ladder == "handSet")
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
    if(input$z.ladder == "overallSet1")
      {
      #
      #
      #
      barFill <- scale_fill_manual(name = "Services Access",
                                   labels = c("Adequate water and sanitation",
                                              "Adequate water only",
                                              "Adequate sanitation only",
                                              "No access to adequate services"),
                                   values = overallColour)
      }
    #
    # Facets - type and surveyArea
    #
    if(input$x.ladder == "type" & input$y.ladder == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if((input$x.ladder == "surveyArea" | input$x.ladder == "wealth") & input$y.ladder == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.ladder))
    #
    # x-axis labels
    #
    xLabel <- labs(y = "Proportion")
    #
    # y-axis label for surveyArea
    #
    if(input$x.ladder == "surveyArea") yLabel <- labs(x = "Survey Area")
    #
    # y-axis label for type
    #
    if(input$x.ladder == "type") yLabel <- labs(x = "Area Type")    
    #
    # y-axis label for wealthQuintile
    #
    if(input$x.ladder == "wealth") yLabel <- labs(x = "Wealth Quintile")    
    #
    # Create plot
    #
    p <- basePlot + barPlot + barFill + yLabel + xLabel + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.ladder != "." & input$x.ladder != input$y.ladder & input$x.ladder != "wealth")
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 500)


################################################################################
#
# Plot overall indicators
#
################################################################################
  #
  # 
  #
  output$overall <- renderPlot({
    #
    #
    #
    if(input$x.overall == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.overall(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))
    #
    #
    #
    if(input$x.overall == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.overall(),
                         mapping = aes_string(x = input$x.overall,
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    if(input$x.overall == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.overall(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate",
                                              fill = "indicatorCode"))      
    #
    #
    #
    barPlot <- geom_bar(stat = "identity", position = "fill", alpha = 0.8)
    #
    #
    #
    barFill <- scale_fill_manual(name = "Services Access",
                                 labels = c("Adequate water and sanitation",
                                            "Adequate water only",
                                            "Adequate sanitation only",
                                            "No access to adequate services"),
                                 values = rev(overallColour))
    #
    # Facets - type and surveyArea
    #
    if(input$x.overall == "type" & input$y.overall == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if((input$x.overall == "surveyArea" | input$x.overall == "wealth") & input$y.overall == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.overall))
    #
    # x-axis labels
    #
    xLabel <- labs(y = "Proportion")
    #
    # y-axis label for surveyArea
    #
    if(input$x.overall == "surveyArea") yLabel <- labs(x = "Survey Area")
    #
    # y-axis label for type
    #
    if(input$x.overall == "type") yLabel <- labs(x = "Area Type")    
    #
    # y-axis label for wealthQuintile
    #
    if(input$x.overall == "wealth") yLabel <- labs(x = "Wealth Quintile")    
    #
    # Create plot
    #
    p <- basePlot + barPlot + barFill + yLabel + xLabel + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.overall != "." & input$x.overall != input$y.overall & input$x.overall != "wealth")
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 500)


################################################################################
#
# Plot water indicators
#
################################################################################
  #
  # 
  #
  output$water <- renderPlot({
    #
    #
    #
    if(input$x.water == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.water(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.water == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.water(),
                         mapping = aes_string(x = input$x.water,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.water == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.water(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.water == "type" & input$y.water == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.water == "surveyArea" & input$y.water == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.water))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.water == "wealth" & input$y.water == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.water))
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$z.water == "water12" & input$country4 == "Bangladesh", "Bangladesh Taka (BDT)", "Proportion"))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.water == "surveyArea", "Survey Area",
                         ifelse(input$x.water == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + theme_wsup
    #
    #
    #
    if(input$z.water != "water12")
      #
      #
      #
      p <- p + ylim(c(0, 1))
    #
    # Set conditions for displaying facets
    #
    if(input$y.water != "." & input$x.water != input$y.water)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 500)
  
  
################################################################################
#
# Plot sanitation indicators
#
################################################################################
  #
  # 
  #
  output$sanitation <- renderPlot({
    #
    #
    #
    if(input$x.sanitation == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.sanitation(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.sanitation == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.sanitation(),
                         mapping = aes_string(x = input$x.sanitation,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.sanitation == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.sanitation(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.sanitation == "type" & input$y.sanitation == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.sanitation == "surveyArea" & input$y.sanitation == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.sanitation))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.sanitation == "wealth" & input$y.sanitation == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.sanitation))
    #
    # y-axis labels
    #
    yLabel <- labs(y = ifelse(input$z.sanitation == "san14" & input$country5 == "Bangladesh", "Bangladesh Taka (BDT)", 
                         ifelse(input$z.sanitation == "san13", "Time (minutes)", "Proportion")))
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.sanitation == "surveyArea", "Survey Area",
                         ifelse(input$x.sanitation == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + theme_wsup
    #
    #
    #
    if(!input$z.sanitation %in% c("san13", "san14"))
      #
      #
      #
      p <- p + ylim(c(0, 1))
    #
    # Set conditions for displaying facets
    #
    if(input$y.sanitation != "." & input$x.sanitation != input$y.sanitation)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 500)


################################################################################
#
# Plot hygiene indicators
#
################################################################################
  #
  # 
  #
  output$hygiene <- renderPlot({
    #
    #
    #
    if(input$x.hygiene == "surveyArea")
      #
      #
      #
      basePlot <- ggplot(data = area.hygiene(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))
    #
    #
    #
    if(input$x.hygiene == "type")
      #
      #
      #
      basePlot <- ggplot(data = area.hygiene(),
                         mapping = aes_string(x = input$x.hygiene,
                                              y = "estimate"))      
    #
    #
    #
    if(input$x.hygiene == "wealth")
      #
      #
      #
      basePlot <- ggplot(data = wealth.hygiene(),
                         mapping = aes_string(x = "strata",
                                              y = "estimate"))      
    #
    #
    #
    barPlot <- geom_bar(colour = wsupColour, fill = wsupColour, stat = "identity", alpha = 0.6)
    #
    # Facets - type and surveyArea
    #
    if(input$x.hygiene == "type" & input$y.hygiene == "surveyArea")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ strata, labeller = labeller(strata = addArea))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.hygiene == "surveyArea" & input$y.hygiene == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.hygiene))
    #
    # Facets - surveyArea or wealth and type
    #
    if(input$x.hygiene == "wealth" & input$y.hygiene == "type")
      #
      # Create facet
      #
      barFacet <- facet_wrap(facets = ~ get(input$y.hygiene))
    #
    # y-axis labels
    #
    yLabel <- labs(y = "Proportion")
    #
    # x-axis labels
    #
    xLabel <- labs(x = ifelse(input$x.hygiene == "surveyArea", "Survey Area",
                         ifelse(input$x.hygiene == "type", "Area Type", "Wealth Quintile")))      
    #
    # Create plot
    #
    p <- basePlot + barPlot + yLabel + xLabel + ylim(c(0, 1)) + theme_wsup
    #
    # Set conditions for displaying facets
    #
    if(input$y.hygiene != "." & input$x.hygiene != input$y.hygiene)
      #
      # Add facets to plot
      #
      p <- p + barFacet
    #
    # Print plot
    #       
    print(p)
  }, height = 500)


################################################################################
#
#
# Create leaflet maps
#
#
################################################################################
 
################################################################################
#
# Demographics Map
#
################################################################################ 
  #
  #
  #
  output$map.demographics <- renderLeaflet({
    #
    # 
    #
    if(input$map.colour.demographics == "linear")
      {
      #
      #
      #
      values <- c(1, max(c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])))      
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.demographics,
                          domain = values)
      }
    #
    #
    #
    if(input$map.colour.demographics == "interval")
      {
      #
      #
      #
      values <- c(1, max(c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])))
      #
      #
      #
      pal <- colorBin(palette = input$palette.demographics, 
                      domain = values,
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.demographics), 5, input$map.bins.demographics))
      }
    #
    #
    #
    if(input$map.colour.demographics == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.demographics,
                           domain = c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]]),
                           n = ifelse(is.null(input$map.n.demographics), 5, input$map.n.demographics))
      #
      #
      #
      values <- c(slum.results.sp[[input$z.demographics]], city.results.sp[[input$z.demographics]])
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.demographics]], " household members", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.demographics]], " household members", sep = "")
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
  			    lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
               attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
      #
      #
      #
      addMiniMap(tiles = mapbox.street,
                 toggleDisplay = TRUE,
                 position = "topright",
                 width = 150, height = 150) %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$z.demographics]]),
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
      # Citywid polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$z.demographics]]),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      #
      #
      addLegend(pal = pal, values = values, opacity = 0.7,
	    position = "bottomright", 
	    labFormat = ifelse(input$map.colour.demographics == "quantile", legend.format(digits = 2, between = " to "), labelFormat(digits = 2, between = " to ")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.demographics],
	    layerId = "legend") %>%
      #
      #
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        position = "bottomleft",
        options = layersControlOptions(collapsed = FALSE, autoZIndex = TRUE)) %>%
      #
      #
      #
      hideGroup(c("Upazila", "Wards")) %>%
      #
      #
      #
      htmlwidgets::onRender("
        function(el, x) {
          this.on('baselayerchange', function(e) {
            e.layer.bringToBack();
          })
        }
      ")
  })

  
################################################################################
#
# Poverty maps
#
################################################################################  
  #
  # Poverty base map
  #
  output$map.poverty <- renderLeaflet({
    #
    # Create map
    # 
    leaflet(outline) %>%
      #
      # Fit map into the area boundaries
      #
      fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
  			    lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>%
      #
      # Add baselayer - Mapbox satellite
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
               attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
      #
      # Add a minimap
      #
      addMiniMap(tiles = mapbox.street,
                 toggleDisplay = TRUE,
                 position = "topright")
  })
  #
  # Create leaflet proxy
  #
  observe({
    #
    # Set indicator domains
    #
    if(input$z.poverty == "ppi") domain <- c(0, 100)
    if(input$z.poverty == "ppp125") domain <- c(0, 1)
    if(input$z.poverty == "pQuintile") domain <- c(1, 5)
    #
    # Linear interpolation
    #
    if(input$map.colour.poverty == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.poverty,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.poverty == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.poverty,
                      domain = domain, 
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.poverty), 5, input$map.bins.poverty))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.poverty == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.poverty,
                           domain = c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]]),
                           n = ifelse(is.null(input$map.n.poverty), 5, input$map.n.poverty))
      #
      #
      #
      values <- c(slum.results.sp[[input$z.poverty]], city.results.sp[[input$z.poverty]])
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.poverty]], sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.poverty]], sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "")
	#
	#
	#
	leafletProxy("map.poverty") %>%
	#
	#
    #
    clearShapes() %>%
	#
	# Slum polygon
	#
	addPolygons(
	  data = slum.results.sp,
	  fillColor = pal(slum.results.sp[[input$z.poverty]]), 
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
	# City polygon
	#
	addPolygons(
	  data = city.results.sp,
	  fillColor = pal(city.results.sp[[input$z.poverty]]),
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
	# Add Upazila polygons
	#
	addPolygons(
	  data = upazila,
	  weight = 1,
	  opacity = 1,
	  color = "white",
	  dashArray = "3",
	fillOpacity = 0,
	highlight = highlightOptions(
	  weight = 4,
	  color = "#666",
	  dashArray = "",
	  fillOpacity = 0,
	  bringToFront = TRUE),
	label = upazila.labels,
	labelOptions = labelOptions(
	  style = list("font-weight" = "normal", padding = "3px 8px"),
	  textsize = "12px",
	  direction = "auto"),
	group = "Upazila") %>%
    #
    # Add Wards polygons
    #
    addPolygons(
	  data = wards,
	  weight = 0.5,
	  opacity = 1,
	  color = "white",
	  dashArray = "2",
	  fillOpacity = 0,
	  highlight = highlightOptions(
	    weight = 3,
	    color = "#666",
	    dashArray = "",
	    fillOpacity = 0,
	    bringToFront = TRUE),
	  label = ward.labels,
	  labelOptions = labelOptions(
	    style = list("font-weight" = "normal", padding = "3px 8px"),
	    textsize = "12px",
	    direction = "auto"),
	  group = "Wards") %>%
    #
    # Add legend
    #
    addLegend(
	  pal = pal, 
	  values = values,
	  opacity = 0.7,
	  position = "bottomright", 
	  labFormat = ifelse(input$map.colour.poverty == "quantile", legend.format(digits = 2, between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "")),
	  title = steerIndicators$varShort[steerIndicators$varList == input$z.poverty],
	  layerId = "legend") %>%
    #
    # Add layer control
    #
    addLayersControl(
	  baseGroups = c("Slum", "Citywide"),
	  overlayGroups = c("Upazila", "Wards"),
	  position = "bottomleft",
	  options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Ladder maps
#
################################################################################  
  #
  # Ladder
  #
  output$map.ladder <- renderLeaflet({
    #
    #
    # 
    leaflet(outline) %>%
      #
      #
      #
      fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
  			    lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>%
      #
      #
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
               attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
      #
      #
      #
      addMiniMap(tiles = mapbox.street,
                 toggleDisplay = TRUE,
                 position = "topright")
  })
  #
  #
  #
  observe({
    #
    # Domains
    #
    domain <- c(0, 100)
    #
    # Linear interpolation
    #
    if(input$map.colour.ladder == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.ladder,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.ladder == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.ladder,
                      domain = domain, 
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.ladder), 5, input$map.bins.ladder))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.ladder == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.ladder,
                           domain = c(slum.results.sp[[input$indicator.ladder]] * 100, city.results.sp[[input$indicator.ladder]] * 100),
                           n = ifelse(is.null(input$map.n.ladder), 5, input$map.n.ladder))
      #
      #
      #
      values <- c(slum.results.sp[[input$indicator.ladder]] * 100, city.results.sp[[input$indicator.ladder]] * 100)
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$indicator.ladder]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$indicator.ladder]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
    #
    #
    #
    leafletProxy("map.ladder") %>%
      #
      #
      #
      clearShapes() %>%
      #
      # Slum polygon
      #
      addPolygons(
        data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$indicator.ladder]] * 100), 
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
      # City polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$indicator.ladder]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
      #
      # Add legend
      #
      addLegend(
        pal = pal, 
        values = values,
        opacity = 0.7,
	    position = "bottomright", 
	    labFormat = ifelse(input$map.colour.ladder == "quantile", legend.format(digits = 2, between = " to ", suffix = "%"), labelFormat(digits = 2, between = " to ", suffix = "%")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$indicator.ladder],
	    layerId = "legend") %>%
      #
      # Add layer control
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        position = "bottomleft",
        options = layersControlOptions(collapsed = FALSE)) %>%
      #
      # Hide overlays
      #
      hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Water
#
################################################################################
  #
  # Water
  #
  output$map.water <- renderLeaflet({
    #
    #
    #
    leaflet(outline) %>%
    #
    #
    #
    fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
  			  lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>%
    #  
    #
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
             attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
    #
    #
    #
    addMiniMap(tiles = mapbox.street,
               toggleDisplay = TRUE,
               position = "topright")
  })
  #
  #
  #
  observe({
    #
    #
    #
    if(input$z.water != "water12")
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.water == "linear")
        {
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.water,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)        
        }
      #
      # Equal interval
      #
      if(input$map.colour.water == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorBin(palette = input$palette.water,
                        domain = domain, 
                        pretty = TRUE,
                        bins = ifelse(is.null(input$map.bins.water), 5, input$map.bins.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)        
        }
      #
      # Quantile
      #
      if(input$map.colour.water == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.water]] * 100, city.results.sp[[input$z.water]] * 100)
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.water,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.water), 5, input$map.n.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]] * 100)
        city.fill <- pal(city.results.sp[[input$z.water]] * 100)
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.water]] * 100, "%", sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.water]] * 100, "%", sep = "")
      }
    #
    #
    #  
    if(input$z.water == "water12")
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.water == "linear")
        {
        domain <- c(0, max(c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])))
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.water,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])                
        }
      #
      # Equal interval
      #
      if(input$map.colour.water == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])))
        #
        #
        #
        pal <- colorBin(palette = input$palette.water,
                        domain = domain, 
                        pretty = TRUE,
                        bins = ifelse(is.null(input$map.bins.water), 5, input$map.bins.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])        
        }
      #
      # Quantile
      #
      if(input$map.colour.water == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.water]], city.results.sp[[input$z.water]])
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.water,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.water), 5, input$map.n.water))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.water]])
        city.fill <- pal(city.results.sp[[input$z.water]])        
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.water]], sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.water]], sep = "")
      }
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
  #
  #
  #
  leafletProxy("map.water") %>%
    #
    #
    #
    clearShapes() %>%
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = slum.fill,
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = city.fill,
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomright",
	  labFormat = ifelse(input$map.colour.water == "quantile" & input$z.water == "water12", legend.format(digits = 2, between = " to ", suffix = ""), 
	                ifelse(input$map.colour.water == "quantile" & input$z.water != "water12", legend.format(digits = 2, between = " to ", suffix = "%"), 
	                  ifelse(input$map.colour.water != "quantile" & input$z.water == "water12", labelFormat(digits = 2, between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")))),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.water],
	    layerId = "Slum") %>%
    #
    # Add toggle box for map layers
    #
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      position = "bottomleft",
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Sanitation
#
################################################################################
  #
  # Sanitation
  #
  output$map.sanitation <- renderLeaflet({
    #
    # Create map
    #
    leaflet(outline) %>%
    #
    # Fit map to the boundaries of the survey area
    #
    fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
              lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>% 
    #  
    # Add baselayer
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
             attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
    #
    # Add minimap
    #
    addMiniMap(tiles = mapbox.street,
               toggleDisplay = TRUE,
               position = "topright")
  })
  #
  #
  #
  observe({
    #
    #
    #
    if(!input$z.sanitation %in% c("san13", "san14"))
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.sanitation == "linear")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.sanitation,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(city.results.sp[[input$z.sanitation]] * 100)
        }
      #
      # Equal interval
      #
      if(input$map.colour.sanitation == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, 100)
        #
        #
        #
        pal <- colorBin(palette = input$palette.sanitation,
                        domain = domain, 
                        pretty = TRUE,
                        bins = ifelse(is.null(input$map.bins.sanitation), 5, input$map.bins.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(city.results.sp[[input$z.sanitation]] * 100)
        }
      #
      # Quantile
      #
      if(input$map.colour.sanitation == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.sanitation]] * 100, city.results.sp[[input$z.sanitation]] * 100)
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.sanitation,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.sanitation), 5, input$map.n.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]] * 100)
        city.fill <- pal(city.results.sp[[input$z.sanitation]] * 100)
        }
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.sanitation]] * 100, "%", sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.sanitation]] * 100, "%", sep = "")
      }
    #
    #
    #
    if(input$z.sanitation %in% c("san13", "san14"))
      {
      #
      # Linear interpolation
      #
      if(input$map.colour.sanitation == "linear")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])))
        #
        #
        #
        pal <- colorNumeric(palette = input$palette.sanitation,
                            domain = domain)
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(city.results.sp[[input$z.sanitation]])
        }
      #
      # Equal interval
      #
      if(input$map.colour.sanitation == "interval")
        {
        #
        # Domains
        #
        domain <- c(0, max(c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])))
        #
        #
        #
        pal <- colorBin(palette = input$palette.sanitation,
                        domain = domain, 
                        pretty = TRUE,
                        bins = ifelse(is.null(input$map.bins.sanitation), 5, input$map.bins.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(city.results.sp[[input$z.sanitation]])
        }
      #
      # Quantile
      #
      if(input$map.colour.sanitation == "quantile")
        {
        #
        # Domains
        #
        domain <- c(slum.results.sp[[input$z.sanitation]], city.results.sp[[input$z.sanitation]])
        #
        #
        #
        pal <- colorQuantile(palette = input$palette.sanitation,
                             domain = domain,
                             n = ifelse(is.null(input$map.n.sanitation), 5, input$map.n.sanitation))
        #
        #
        #
        values <- domain
        #
        #
        #
        slum.fill <- pal(slum.results.sp[[input$z.sanitation]])
        city.fill <- pal(city.results.sp[[input$z.sanitation]])
        }    
      #
      #
      #  
      slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.sanitation]], sep = "")
      city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.sanitation]], sep = "")
      }
    #
    # 
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
  #
  #
  #
  leafletProxy("map.sanitation") %>%
    #
    #
    #
    clearShapes() %>%
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = slum.fill,
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = city.fill,
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomright",
	  labFormat = ifelse(input$map.colour.sanitation == "quantile" & (input$z.sanitation == "san13" | input$z.sanitation == "san14"), legend.format(digits = 2, between = " to ", suffix = ""), 
	                ifelse(input$map.colour.sanitation == "quantile" & input$z.sanitation != "san13" & input$z.sanitation != "san14", legend.format(digits = 2, between = " to ", suffix = "%"), 
	                  ifelse(input$map.colour.sanitation != "quantile" & (input$z.sanitation == "san13" | input$z.sanitation == "san14"), labelFormat(between = " to ", suffix = ""), labelFormat(between = " to ", suffix = "%")))),
	    title = steerIndicators$varShort[steerIndicators$varList == input$z.sanitation],
	    layerId = "Slum") %>%
    #
    # Add toggle box for layers
    #
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      position = "bottomleft",
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Hygiene
#
################################################################################
  #
  # hygiene
  #
  output$map.hygiene <- renderLeaflet({
    #
    # Create map based on survey area
    #
    leaflet(outline) %>%
    #
    # Fit map to the boundaries of the survey area
    #    
    fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
              lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>% 
    #
    #
    #
    addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
             attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
    #
    #
    #
    addMiniMap(tiles = mapbox.street,
               toggleDisplay = TRUE,
               position = "topright")
  })             
  #
  #
  #
  observe({
    #
    # Linear interpolation
    #
    if(input$map.colour.hygiene == "linear")
      {
      #
      # Domains
      #
      domain <- c(0, 100)
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.hygiene,
                          domain = domain)
      #
      #
      #
      values <- domain
      }
    #
    # Equal interval
    #
    if(input$map.colour.hygiene == "interval")
      {
      #
      # Domains
      #
      domain <- c(0, 100)
      #
      #
      #
      pal <- colorBin(palette = input$palette.hygiene,
                      domain = domain, 
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.hygiene), 5, input$map.bins.hygiene))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.hygiene == "quantile")
      {
      #
      # Domains
      #
      domain <- c(slum.results.sp[[input$z.hygiene]] * 100, city.results.sp[[input$z.hygiene]] * 100)
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.hygiene,
                            domain = domain,
                            n = ifelse(is.null(input$map.n.hygiene), 5, input$map.n.hygiene))
      #
      #
      #
      values <- domain
      }
    #
    #
    #
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$z.hygiene]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$z.hygiene]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "") 
  #
  #
  #
  leafletProxy("map.hygiene") %>%
    #
    #
    #
    clearShapes() %>%  
    #
    # Slum Map
    #
    addPolygons(
      data = slum.results.sp,
	  fillColor = pal(slum.results.sp[[input$z.hygiene]] * 100),
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
    # Citywide map
    #
    addPolygons(
      data = city.results.sp,
	  fillColor = pal(city.results.sp[[input$z.hygiene]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%
    #
    # Legend
    #
    addLegend(pal = pal, 
      values = values, 
      opacity = 0.7,
	  position = "bottomright",
	  labFormat = ifelse(input$map.colour.hygiene != "quantile", labelFormat(between = " to ", suffix = "%"), legend.format(digits = 2, between = " to ", suffix = "%")),
	  title = steerIndicators$varShort[steerIndicators$varList == input$z.hygiene],
	  layerId = "Slum") %>%
    #
    #
    #
    addLayersControl(
      baseGroups = c("Slum", "Citywide"),
      overlayGroups = c("Upazila", "Wards"),
      position = "bottomleft",
      options = layersControlOptions(collapsed = FALSE)) %>%
    #
    # Hide overlays
    #
    hideGroup(c("Upazila", "Wards")) %>%
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


################################################################################
#
# Overall maps
#
################################################################################  
  #
  # Overall
  #
  output$map.overall <- renderLeaflet({
    #
    #
    #
    leaflet(outline) %>%
      #
      #
      #
      fitBounds(lng1 = bbox(outline)[1,1], lat1 = bbox(outline)[2,1],
                lng2 = bbox(outline)[1,2], lat2 = bbox(outline)[2,2]) %>% 
      #
      # Add satellite map baselayer
      #
      addTiles(urlTemplate = mapbox.satellite, group = "Satellite",
               attribution = "Imagery from <a href='https://www.mapbox.com'>Mapbox</a> | Data layers © <a href='http://www.validinternational.org'>Valid International</a>") %>%
      #
      # Add minimap
      #
      addMiniMap(tiles = mapbox.street,
                 toggleDisplay = TRUE,
                 position = "topright")
  })
  #
  #
  #
  observe({
    #
    # Domains
    #
    domain <- 0:100
    #
    # Linear interpolation
    #
    if(input$map.colour.overall == "linear")
      {
      #
      #
      #
      pal <- colorNumeric(palette = input$palette.overall,
                          domain = domain)
      #
      #
      #
      values <- domain

      }
    #
    # Equal interval
    #
    if(input$map.colour.overall == "interval")
      {
      #
      #
      #
      pal <- colorBin(palette = input$palette.overall,
                      domain = domain, 
                      pretty = TRUE,
                      bins = ifelse(is.null(input$map.bins.overall), 5, input$map.bins.overall))
      #
      #
      #
      values <- domain
      }
    #
    # Quantile
    #
    if(input$map.colour.overall == "quantile")
      {
      #
      #
      #
      pal <- colorQuantile(palette = input$palette.overall,
                           domain = c(slum.results.sp[[input$indicator.overall]] * 100, city.results.sp[[input$indicator.overall]] * 100),
                           n = ifelse(is.null(input$map.n.overall), 5, input$map.n.overall))
      #
      #
      #
      values <- c(slum.results.sp[[input$indicator.overall]] * 100, city.results.sp[[input$indicator.overall]] * 100)
      }
    #
    #
    #  
    slum.labels <- paste(slum.results.sp$surveyArea, ": ", slum.results.sp[[input$indicator.overall]] * 100, "%", sep = "")
    city.labels <- paste(city.results.sp$surveyArea, ": ", city.results.sp[[input$indicator.overall]] * 100, "%", sep = "")
    #
    #
    #      
    upazila.labels <- paste("Upazila: ", upazila$Upazila, sep = "") 
    ward.labels <- paste("Ward: ", wards$Union, sep = "")
    #
    #
    #
    leafletProxy("map.overall") %>%
      #
      #
      #
      clearShapes() %>%
      #
      # Slum polygon
      #
      addPolygons(data = slum.results.sp,
	    fillColor = pal(slum.results.sp[[input$indicator.overall]] * 100), 
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
      # City polygon
      #
      addPolygons(
        data = city.results.sp,
	    fillColor = pal(city.results.sp[[input$indicator.overall]] * 100),
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
      # Add Upazila polygons
      #
      addPolygons(
        data = upazila,
	    weight = 1,
	    opacity = 1,
	    color = "white",
	    dashArray = "3",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 4,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = upazila.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Upazila") %>%
      #
      # Add Wards polygons
      #
      addPolygons(
        data = wards,
	    weight = 0.5,
	    opacity = 1,
	    color = "white",
	    dashArray = "2",
	    fillOpacity = 0,
	    highlight = highlightOptions(
	      weight = 3,
	      color = "#666",
	      dashArray = "",
	      fillOpacity = 0,
	      bringToFront = TRUE),
	    label = ward.labels,
	    labelOptions = labelOptions(
	      style = list("font-weight" = "normal", padding = "3px 8px"),
	      textsize = "12px",
	      direction = "auto"),
	    group = "Wards") %>%                 
      #
      # Add legend
      #
      addLegend(pal = pal,
        values = values,
        opacity = 0.7,
	    position = "bottomright",
	    labFormat = ifelse(input$map.colour.overall != "quantile", labelFormat(between = " to ", suffix = "%"), legend.format(digits = 2, between = " to ", suffix = "%")),
	    title = steerIndicators$varShort[steerIndicators$varList == input$indicator.overall],
	    layerId = "legend") %>%
      #
      # Add layer control
      #
      addLayersControl(
        baseGroups = c("Slum", "Citywide"),
        overlayGroups = c("Upazila", "Wards"),
        position = "bottomleft",
        options = layersControlOptions(collapsed = FALSE)) %>%
      #
      # Hide overlays
      #
      hideGroup(c("Upazila", "Wards")) %>%
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

################################################################################
#
#
# Data Tables
#
#
################################################################################
  
################################################################################
  #
  # Create data table output for demographics indicator set
  #
  output$table.demographics <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(indicatorsDF, select = c(country, ccode, zone, type, nMembers))
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country1)
    #
    # Filter data by survey area
    #
    if(input$table.demographics.area != "All")
      {
      #
      #
      #
      df <- df[df$zone == input$table.demographics.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.demographics.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.demographics.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for poverty indicator set
  #
  output$table.poverty <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    # Subset to poverty indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "poverty"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country2)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.poverty)
    #
    # Filter data by survey area
    #
    if(input$table.poverty.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.poverty.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.poverty.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.poverty.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for service ladder indicator set
  #
  output$table.ladder <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to ladder indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$z.ladder], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country3)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$indicator.ladder)
    #
    # Filter data by survey area
    #
    if(input$table.ladder.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.ladder.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.ladder.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.ladder.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other water indicator set
  #
  output$table.water <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[df$indicatorCode != "water12" , c("estimate", "lcl", "ucl")] <- df[df$indicatorCode != "water12" , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to water indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet != "waterSet1"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country4)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.water)
    #
    # Filter data by survey area
    #
    if(input$table.water.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.water.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.water.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.water.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other sanitation indicator set
  #
  output$table.sanitation <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[!df$indicatorCode %in% c("san13", "san14") , c("estimate", "lcl", "ucl")] <- df[!df$indicatorCode %in% c("san13", "san14"), c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to sanitation indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet != "sanSet1"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country5)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.sanitation)
    #
    # Filter data by survey area
    #
    if(input$table.sanitation.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.sanitation.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.sanitation.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.sanitation.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other hygiene indicator set
  #
  output$table.hygiene <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to hygiene indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == "hygieneSet"], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country6)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$z.hygiene)
    #
    # Filter data by survey area
    #
    if(input$table.hygiene.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.hygiene.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.hygiene.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.hygiene.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))

################################################################################
  #
  # Create data table output for other overall indicator set
  #
  output$table.overall <- DT::renderDataTable(DT::datatable({
    #
    # Subset to selected indicator/indicator set
    #
    df <- subset(areaResultsLong, select = c(country, countryCode, 
                                             indicatorName, indicatorCode, indicatorCategory, 
                                             strata, estimate, lcl, ucl, type))
    #
    #
    #                                         
    df[ , c("estimate", "lcl", "ucl")] <- df[ , c("estimate", "lcl", "ucl")] * 100
    #
    # Subset to overall indicator set
    #
    df <- df[df$indicatorCode %in% steerIndicators$varList[steerIndicators$varSet == input$z.overall], ]
    #
    # Subset to specific country based on country selection
    #
    df <- subset(df, country == input$country7)
    #
    # Subset to specific indicator based on indicator selection
    #
    df <- subset(df, indicatorCode == input$indicator.overall)
    #
    # Filter data by survey area
    #
    if(input$table.overall.area != "All")
      {
      #
      #
      #
      df <- df[df$strata == input$table.overall.area, ]
      }
    #
    # Filter data by area type
    #
    if(input$table.overall.type != "All")
      {
      #
      #
      #
      df <- df[df$type == input$table.overall.type, ]
      }
    #
    # return data table
    #
    df
  }, 
  #
  # Table options
  #
  options = list(pageLength = 10)))


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
    inputFile <- input$file1
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
	  if(!is.null(input$file1))
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
									                       ifelse(is.null(input$file1), "No data", round(icc, digits = 4)), 
								                           ifelse(is.null(input$file1), paste(design.effect, "(assumed)", sep = " "), paste(round(design.effect, digits = 4), "(based on data)", sep = " ")),
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
      setView(lng = 0, lat = 0, zoom = 2)
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
      #setView(lng = mean(coordinates(city.map())[,1]), 
      #        lat = mean(coordinates(city.map())[,2]), 
      #        zoom = 11) %>%
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
		  bringToFront = TRUE),
		group = "Survey Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Survey Areas"),
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
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
		  bringToFront = TRUE),
		group = "Slum Areas") %>%
        #
        # Add layer control
        #
        addLayersControl(
          baseGroups = c("Slum Areas"),
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
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
          position = "bottomleft",
          options = layersControlOptions(collapsed = FALSE))		      
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
          options = layersControlOptions(collapsed = FALSE))		      
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
  #
  #
  #
  output$message.list1 <- eventReactive(input$sample.city == 0, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
  #
  #
  #
  output$message.list2 <- eventReactive(input$sample.slum1 == 0, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
  #
  #
  #
  output$message.list3 <- eventReactive(input$sample.slum2 == 0, {
    #
    #
    #
    showModal(modalDialog(title = "No sampling lists available",
                          size = "m",
                          HTML("
                            <p>There are no sampling lists available yet. This is most likely because:</p>
                            <ul>
                              <li>you have not provided a map of the survey area to sample; and/or</li> 
                              <li>you have not clicked on the <code>Map</code> button to create the map; and/or</li>
                              <li>you have not provided additional information regarding specific area on the map you want to sample; and/or</li>
                              <li>you have not clicked on the <code>Sample</code> button to create the samplig grid on your selected sampling area.</li>
                            </ul>
                            <br/>
                            </p>Please go through these steps again and then come back to this tab to view the sampling list created.</p>
                          ")))
  })
}






