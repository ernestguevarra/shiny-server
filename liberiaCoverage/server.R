################################################################################
#
#
#
# This is a Shiny web application to support the implementation of health and
# nutrition coverage surveys in Liberia.
# 
# This code is for the server logic function of the Shiny web aplication.
#
#
################################################################################


################################################################################
#
# Server logic for web application
#
################################################################################
#
# Define server logic for application
#
server <- function(input, output, session) {
  output$descriptionImam <- renderUI({
    if("sam" %in% input$designIndicators) {
      withMathJax(
        HTML("
          <h4>SAM treatment coverage</h4>
          <p>SAM treatment coverage usually pertains to coverage of SAM treatment. SAM treatment coverage has two indicators:</p>
          <ul>
            <li>Case-finding effectiveness</li>
            $$\\begin{aligned} 
            \\text{Case-finding effectiveness} & ~ = ~ \\frac{C_{in}}{C_{in} ~ + ~ C_{out}} \\\\
            \\\\
            where: & \\\\
            \\\\
            C_{in} & ~ = ~ \\text{current SAM cases in the programme} \\\\
            C_{out} & ~ = ~ \\text{current SAM cases out of the programme}
            \\end{aligned}$$
            <br/>
            <li>Treatment coverage</li>
            $$\\begin{aligned}
            \\text{Treatment coverage} & ~ = ~ \\frac{C_{in} ~ + ~ R_{in}}{C_{in} ~ + ~ R_{in} ~ + ~ C_{out} ~ + ~ R_{out}} \\\\
            \\\\
            where: & \\\\
            \\\\
            R_{in} & ~ = ~ \\text{Recovering SAM cases in the programme} \\\\
            R_{out} & ~ = ~ \\text{Recovering SAM cases not in the programme}
            \\end{aligned}$$
          </ul>
          <br/>
        ")
      )
    }
  })
  output$descriptionVita <- renderUI({
    if("vita" %in% input$designIndicators) {
      HTML("
        <h4>Vitamin A supplementation coverage</h4>
        <p>The standard estimator for vitamin A supplementation is the proportion of children aged 6-59 months who received two age-appropriate doses of vitamin A in the past 12 months.</p>

        <p>In standard surveys such as the DHS and MICS, this indicator is adjusted to a recall of 6 months for a single age-appropriate dose of vitamin A.</p>

        <p>In order to determine whether supplementation with vitamin A is age appropriate, vitamin A supplementation should first be assessed on the child's health card. Provision of vitamin A card is usually recorded on the child's health card with the corresponding does given. If health card not available or if health card is lost or if the child doesn't have a health card at all, then the mother/caregiver will have to be asked whether their child has received vitamin A in the past 6 months and respond by recall. If the mother/caregiver says yes, then the next question to ask will be which type of gel capsule was provided. The blue vitamin A gel capsule containing 100,000 IU of vitamin A is given to children 6-11 months. The red vitamin A gel capsule containing 200,000 IU of vitamin A is given to children 12 - 59 months. A sample of the blue and the red gel capsule (or a photo of the capsules) can be used to aid the mother/caregiver in answering this question.</p> 

        <p>Given this, two indicators can be reported on vitamin A supplementation.</p>

        <ol>
          <li>Any vitamin A supplementation in the past 6 months.</li>
          <br/>
          <li>Age-appropriate vitamin A supplementation in the past 6 months.</li>
        </ol>
        <br/>
      ")
    }
  })
  output$descriptionFefol <- renderUI({
    if("fefol" %in% input$designIndicators) {
      HTML("
        <h4>Iron-Folic Acid supplementation coverage</h4>
        <p>Population-based surveys typically report the percentage of women with a live birth in the two to five years before the survey who received and took IFA supplementation during their most recent pregnancy. Because antenatal care (ANC) is typically the main platform for IFA supplement distribution for pregnant women, survey questions on antenatal care attendance and timing of the first antenatal care visit can provide information on the use of this platform to deliver IFA supplementation. Sununtnasuk et al propose a falter point framework that utilises four indicators that proxy the four critical points at which the ANC approach to IFA distribution might falter in IFA supplementation coverage to pregnant women. These indicators are:</p>
        <ol>
          <li>At least one ANC visit during most recent pregnancy</li>
          <br/>
          <li>Receipt or purchase of IFA tablet/s</li>
          <br/> 
          <li>IFA consumption</li>
          <br/> 
          <li>Adherence to 180 days of supplementation</li>
        </ol>
        <br/>
      ")
    }
  })
  output$descriptionMnp <- renderUI({
    if("mnp" %in% input$designIndicators) {
      HTML("
        <h4>Micronutrient powder supplementation coverage</h4>
        <p>The indicator for coverage of micronutrient powder supplementation is the proportion of children aged 6-23 months who consume micronutrient powder supplements. Depending on the programme protocol on mechanism of distribution and effective intake of MNP, a full indicator set on MNP supplementation can be devised that will be similar to the IFA supplementation falter point or bottleneck framework. For example, if MNPs were being provided through the health centres or health posts, then the following indicators can be assessed hierarchically:</p>
        <ol>
          <li>Health centre / health post attendance in the past month</li>
          <br/> 
          <li>Awareness of MNP</li>
          <br/> 
          <li>Consumption of MNP</li>
        </ol>
        <br/>
      ")
    }
  })
  output$descriptionIycf <- renderUI({
    if("iycf" %in% input$designIndicators) {
      HTML("
        <h4>IYCF counselling coverage</h4>
        <p>There are no standard indicators for IYCF counselling. Any indicator developed for this programme will depend on the mechanics of how the IYCF counselling is delivered and who the target beneficiaries are. In terms of mechanism, what is known so far is that these sessions are delivered via the health clinic/health post and that the target beneficiaries are pregnant women. Given this, similar approach to the IFA supplementation coverage of falter points/bottle necks can be used with the following indicators:</p>
        <ol>
          <li>At least one ANC visit during most recent pregnancy</li>
          <br/> 
          <li>Awareness of IYCF counselling (have they been advised IYCF counselling when they attended ANC)</li>
          <br/> 
          <li>Attendance to IYCF counselling</li>
        </ol>
        <br/>
      ")
    }
  })
  output$sampSizeCalculations <- renderUI({
    HTML("
         <p>In general, the sample size needed for proportion-type indicators such as coverage indicators can be calculated using the following equation.</p>

         $$\\begin{aligned}
         n & ~ = ~ Z^2 ~ \\times ~ \\frac{p(1 ~ - ~ p)}{c ^ 2} \\\\
         \\\\
         where: & \\\\
         \\\\
         Z & ~ = ~ \\text{z-value for preferred confidence interval} \\\\
         p & ~ = ~ \\text{expected indicator proportion/prevalence} \\\\
         c & ~ = ~ \\text{level of precision}
         \\end{aligned}$$
         
         <p>The <strong><i>Z-value</i></strong> is usually <strong><i>1.96</i></strong> for a <strong><i>95% confidence interval</i></strong>. The <strong><i>p</i></strong> should usually be based on previous coverage results if available. If not, it is usually appropriate to set <strong><i>p</i></strong> at <strong><i>50% (0.5)</i></strong> as this results in the highest sample size estimate. The <strong><i>precision (c)</i></strong> for coverage surveys is usually set at <strong><i>±10%</i></strong> based on standard precision used for immunisation coverage.</p>
         
         <p>Using these values, the typical sample size needed for coverage surveys is about <strong><i>96</i></strong>.</p>
         
         $$ n ~ = ~ 1.96^2 ~ \\times ~ \\frac{0.5(1 ~ - ~ 0.5)}{0.10 ^ 2} ~ \\approx ~  96 $$
         
         <p>However, the survey design needs to be taken into account. A cluster survey such as the one that is proposed for the <strong>Liberia Coverage Survey</strong> will need to inflate sample sizes to account for the loss of variance due to the cluster design. This inflation factor is called the <strong><i>design effect (DEFF)</i></strong> which is based on the <strong><i>intracluster correlation coefficient (ICC)</i></strong>.</p>
         
         <p>Generally, a <strong><i>DEFF</i></strong> of <strong><i>2</i></strong> is used to multiply the sample size with to account for the loss of variance. This would mean that a sample size of <strong><i>192</i></strong> would be the target sample size. The <strong><i>DEFF</i></strong> can be calculated using previous cluster survey data that assesses the same indicators. If this dataset is available, it can be uploaded and corresponding variables for the indicator and cluster can be specified to estimate <strong><i>DEFF</i></strong> to use.</p>
         
         <p>The sample size required will also depend on the indicators being assessed. Following is a further discussion of sample size requirements for the CMAM coverage survey and for the survey for children 6-59 months and their mothers.</p>
      ")
  })
  ##############################################################################
  #
  # Sample size
  #
  ##############################################################################
  #
  # Read uploaded data for design effect calculations
  #
  deffDf <- reactive({
    inputDeffFile <- input$inputDeffFile
    if(is.null(inputDeffFile)) return(NULL)
    read.csv(file = inputDeffFile$datapath, header = TRUE, sep = ",")
  }) 
  #
  # Update selectInput for indicator and cluster variable
  #
  observe({
    updateSelectInput(session = session,
      inputId = "inputDeffVar",
      label = "Select variable name of indicator to test",
      choices = names(deffDf()))
    updateSelectInput(session = session,
      inputId = "inputDeffCluster",
      label = "Select variable name of survey cluster",
      choices = names(deffDf()))
  })
  #
  #
  #
  observeEvent(input$calcSampSize, {
    #
    # Calculate deff
    #
    if(!is.null(input$inputDeffFile)) {
      icc <- get_icc(x = deffDf()[[input$inputDeffVar]], 
                     cluster = deffDf()[[input$inputDeffCluster]])[["rho"]]
      designEffect <- 1 + (input$inputDeffClusterSize - 1) * icc
    }
    ci <- ifelse(input$zValue == "1.96", "95% CI",
            ifelse(input$zValue == "1.75", "92% CI",
              ifelse(input$zValue == "1.645", "90% CI", "96% CI")))
    #
    # Calculate sample size
    #
    ss <- get_ss_prevalence(z = as.numeric(input$zValue),
                            p = input$sampSizeProp,
                            c = input$sampSizePrec,
                            deff = ifelse(input$inputDeffType == "specify", 
                                          input$inputDeffValue, 
                                          designEffect),
                            fpc = input$sampSizeFpc,
                            pop = if(input$sampSizeFpc) input$sampSizeFpcPop)
    #    
    # Compose data frame
    #
    ssResults <- data.frame(
      Parameters = c("z-value",
                     "Confidence interval",
                     "Prevalence",
                     "Precision",
                     "Cluster size (samples per cluster)",
                     "ICC",
                     ifelse(input$inputDeffType == "specify", 
                            "DEFF (assumed)", 
                            "DEFF (calculated)"),
                     "Sample size"),
      Value = as.character(
                c(input$zValue,
                  ci,
                  paste(input$sampSizeProp * 100, "%", sep = ""),
                  paste("±", input$sampSizePrec * 100, "%", sep = ""),
                  ifelse(is.null(input$inputDeffFile),
                         "NA", input$inputDeffClusterSize),
                  ifelse(is.null(input$inputDeffFile), 
                         "No data", 
                         round(icc, digits = 4)), 
                  ifelse(is.null(input$inputDeffFile), 
                         input$inputDeffValue, 
                         designEffect),
                  round(ss))),
      stringsAsFactors = FALSE)      
    #
    # Header for calculation results
    #
    output$sampSizeHeader <- renderText({
      "Sample size parameters and estimate"
    })
    #
    # Table for sample size calculation results
    #
    output$sampSizeResults <- renderTable({
      ssResults
    })
    #
    # Value box - CI
    #
    output$confIntBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[2],
        subtitle = "Confidence interval",
        icon = icon(name = "balance-scale", 
                    lib = "font-awesome", 
                    class = "fa-md"),
        color = "teal", width = 4)
    })
    #
    # Value box - precision
    #
    output$precisionBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[4],
        subtitle = "Precision",
        icon = icon(name = "check", 
                    lib = "font-awesome", 
                    class = "fa-lg"),
        color = "blue", width = 4)
    })
    #
    # Value box - cluster size
    #
    output$clusterSizeBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[5],
        subtitle = "Cluster size",
        icon = icon(name = "sort-numeric-asc", 
                    lib = "font-awesome", 
                    class = "fa-md"),
        color = "olive", width = 4)
    })
    #
    # Value box - sample size CI
    #
    output$iccBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[6],
        subtitle = "ICC",
        icon = icon(name = "link", 
                    lib = "font-awesome", 
                    class = "fa-lg"),
        color = "orange", width = 4)
    })
    #
    # Value box - sample size parameters
    #
    output$deffBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[7],
        subtitle = ssResults$Parameters[7],
        icon = icon(name = "cog", 
                    lib = "font-awesome", 
                    class = "fa-lg"),
        color = "aqua", width = 4)
    })
    #
    # Value box - sample size
    #
    output$sampSizeBox <- renderValueBox({
      valueBox(
        value = ssResults$Value[8],
        subtitle = "Sample size",
        icon = icon(name = "user", 
                    lib = "font-awesome", 
                    class = "fa-lg"),
        color = "maroon", width = 4)
    })
  })
  #
  # Reset parameters
  #
  observeEvent(input$calcSampSizeReset, {
    output$sampSizeHeader <- renderText({NULL})
    output$sampSizeResults <- renderTable({NULL})
    output$sampSizeBox <- NULL
    output$iccBox <- NULL
    output$deffBox <- NULL
    output$confIntBox <- NULL
    output$precisionBox <- NULL
    output$clusterSizeBox <- NULL
    shinyjs::reset("Sample size calculations")
  })
  ##############################################################################
  #
  # Spatial sampling
  #
  ##############################################################################
  #
  # Base map
  #
  output$mapSampling <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Esri.NatGeoWorldMap) %>%      
      setView(lng = -9.429499, #geocode(location = "Liberia")[1], 
              lat = 6.428055, #geocode(location = "Liberia")[2], 
              zoom = 7)
  })
  #
  # Create area map objects
  #
  mapCountry <- reactive({ 
    if(input$mapSamplingAreaType == "country") counties 
  })
  mapCounty <- reactive({
    if(input$mapSamplingAreaType == "county" & input$mapSamplingCounty != "") {
      counties[counties$admin1name == input$mapSamplingCounty, ]
    }
  })
  mapDistrict <- reactive({
    if(input$mapSamplingAreaType == "district" & input$mapSamplingDistrict != "") {
      districts[districts$admin2Name == input$mapSamplingDistrict, ]
    }
  })
  #
  # Reset map when area type is changed
  #
  observeEvent(input$mapSamplingAreaType, {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls()
    updateSelectInput(session = session,
      inputId = "mapSamplingCounty",
      label = "Select counties to sample",
      choices = list("Select county" = "",
                     "Counties" = counties$admin1name),
      selected = NULL)
    updateSelectInput(session = session,
      inputId = "mapSamplingDistrict",
      label = "Select districts to sample",
      choices = list("Select district" = "",
                     "Districts" = districts$admin2Name),
      selected = NULL)
  })
  #
  # Country borders
  #
  observeEvent(mapCountry(), {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      fitBounds(lng1 = bbox(mapCountry())[1,1], 
                lat1 = bbox(mapCountry())[2,1], 
                lng2 = bbox(mapCountry())[1,2], 
                lat2 = bbox(mapCountry())[2,2]) %>%
      addPolygons(data = mapCountry(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE)
  })
  #
  # County borders
  #
  observeEvent(mapCounty(), {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      fitBounds(lng1 = bbox(mapCounty())[1,1], 
                lat1 = bbox(mapCounty())[2,1], 
                lng2 = bbox(mapCounty())[1,2], 
                lat2 = bbox(mapCounty())[2,2]) %>%
      addPolygons(data = mapCounty(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE)
  })
  #
  # District borders
  #
  observeEvent(mapDistrict(), {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      fitBounds(lng1 = bbox(mapDistrict())[1,1], 
                lat1 = bbox(mapDistrict())[2,1], 
                lng2 = bbox(mapDistrict())[1,2], 
                lat2 = bbox(mapDistrict())[2,2]) %>%
      addPolygons(data = mapDistrict(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE)
  })
  #
  # Create UI for choosing to plot sampling points
  #
  output$mapSamplingPointPlot <- renderUI({
    checkboxInput(inputId = "mapSamplingPointPlot",
                  label = "Plot sampling points",
                  value = FALSE)
  })
  #
  # Create UI for choosing to plot sampling grids
  #
  output$mapSamplingGridPlot <- renderUI({
    checkboxInput(inputId = "mapSamplingGridPlot",
                  label = "Plot sampling grid",
                  value = FALSE)
  })
  #
  # Create UI for choosing to plot settlements/EAs
  #
  output$mapSettlementsPlot <- renderUI({
    checkboxInput(inputId = "mapSettlementsPlot",
                  label = "Plot settlements",
                  value = FALSE)
  })
  #
  # Plot country sampling grid
  #
  observeEvent(input$mapSamplingPlotCountry, {
    if(input$mapSamplingAreaType == "country" & input$mapSamplingSpec == "area") {
      mapSamplingPoint <- create_sp_grid(x = mapCountry(),
                                         area = input$mapSamplingGridArea,
                                         country = "Liberia")
    }
    if(input$mapSamplingAreaType == "country" & input$mapSamplingSpec == "n") {
      mapSamplingPoint <- create_sp_grid(x = mapCountry(),
                                         n = input$mapSamplingGridNumber,
                                         country = "Liberia",
                                         buffer = 2,
                                         n.factor = 5,
                                         fixed = TRUE)
    }
    if(input$mapSamplingAreaType == "country" & input$mapSamplingSpec == "d") {
      mapSamplingPoint <- create_sp_grid(x = mapCountry(),
                                         d = input$mapSamplingGridDist,
                                         country = "Liberia",
                                         buffer = 2)
    }
    #
    # Convert to hexagonal SpatialPolygons
    #
    mapSamplingGrid <- HexPoints2SpatialPolygons(hex = mapSamplingPoint)
    mapSamplingSettlements <- get_nearest_point(data = settlements,
                                                data.x = "COORD_X",
                                                data.y = "COORD_Y",
                                                query = mapSamplingPoint,
                                                n = input$mapSamplingSettlementsNumber)
    #
    #
    #
    output$samplingListDownloadCountry <- downloadHandler(
      filename = function() {
        "countrySamplingList.csv"
      },
      content = function(file) {
        write.csv(mapSamplingSettlements, file)
      }
    )
    #
    # Output data table
    #
    output$mapSamplingTable <- DT::renderDataTable(
      expr = mapSamplingSettlements,
      options = list(scrollX = TRUE)
    )
    #
    # Plot all
    #
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      addPolygons(data = mapCountry(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE) %>%
      addCircleMarkers(data = settlements,
                  lng = ~COORD_X,
                  lat = ~COORD_Y,
                  color = "darkgreen",
                  radius = 0.5,
                  group = "Settlements") %>%
      addPolygons(data = mapSamplingGrid,
                  color = "blue",
                  weight = 4,
                  fill = FALSE,
                  group = "Sampling Grid") %>%
      addCircleMarkers(data = mapSamplingPoint,
                       lng = mapSamplingPoint@coords[,1],
                       lat = mapSamplingPoint@coords[,2],
                       color = "red",
                       radius = 1,
                       group = "Sampling Points") %>%
      addCircleMarkers(data = mapSamplingSettlements,
                       lng = ~COORD_X,
                       lat = ~COORD_Y,
                       color = "red",
                       fill = FALSE,
                       fillOpacity = 0,
                       radius = 6,
                       weight = 1,
                       group = "Selected Settlements") %>%
      hideGroup("Sampling Grid") %>%
      addLayersControl(
        overlayGroups = c("Settlements", "Sampling Grid", "Sampling Points", "Seleced Settlements"),
        position = "topright",
        options = layersControlOptions(collapsed = FALSE, autoZIndex = FALSE))
  })
  #
  # Reset country grid parameters
  #
  observeEvent(input$mapSamplingPlotCountryReset, {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%      
      setView(lng = -9.429499, #geocode(location = "Liberia")[1], 
              lat = 6.428055, #geocode(location = "Liberia")[2], 
              zoom = 7)
    updateSelectInput(session = session,
      inputId = "mapSamplingAreaType",
      label = "Select area type to sample",
      choices = list("Choose one" = "",
                     "Country" = "country",
                     "County" = "county",
                     "District" = "district"),
      selected = NULL)
  })
  #
  # Plot county sampling grid
  #
  observeEvent(input$mapSamplingPlotCounty, {
    if(input$mapSamplingAreaType == "county" & input$mapSamplingSpec == "area") {
      mapSamplingPoint <- create_sp_grid(x = mapCounty(),
                                         area = input$mapSamplingGridArea,
                                         country = "Liberia",
                                         buffer = 2)
    }
    if(input$mapSamplingAreaType == "county" & input$mapSamplingSpec == "n") {
      mapSamplingPoint <- create_sp_grid(x = mapCounty(),
                                         n = input$mapSamplingGridNumber,
                                         country = "Liberia",
                                         buffer = 2,
                                         n.factor = 5,
                                         fixed = TRUE)
    }
    if(input$mapSamplingAreaType == "county" & input$mapSamplingSpec == "d") {
      mapSamplingPoint <- create_sp_grid(x = mapCounty(),
                                         d = input$mapSamplingGridDist,
                                         country = "Liberia",
                                         buffer = 2)
    }
    #
    # Convert to hexagonal SpatialPolygons
    #
    mapSamplingGrid <- HexPoints2SpatialPolygons(hex = mapSamplingPoint)
    mapSamplingSettlements <- get_nearest_point(data = settlements[settlements$admin1Name == input$mapSamplingCounty, ],
                                                data.x = "COORD_X",
                                                data.y = "COORD_Y",
                                                query = mapSamplingPoint,
                                                n = input$mapSamplingSettlementsNumber)
    #
    #
    #
    output$samplingListDownloadCounty <- downloadHandler(
      filename = function() {
        "countySamplingList.csv"
      },
      content = function(file) {
        write.csv(mapSamplingSettlements, file)
      }
    )
    #
    # Output data table
    #
    output$mapSamplingTable <- DT::renderDataTable(
      expr = mapSamplingSettlements,
      options = list(scrollX = TRUE)
    )
    #
    # Plot grids
    #
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      addPolygons(data = mapCounty(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE) %>%
      addCircleMarkers(data = settlements,
                       lng = ~COORD_X,
                       lat = ~COORD_Y,
                       color = "darkgreen",
                       radius = 0.5,
                       group = "Settlements") %>%
      addPolygons(data = mapSamplingGrid,
                  color = "blue",
                  weight = 4,
                  fill = FALSE,
                  group = "Sampling Grid") %>%
      addCircleMarkers(data = mapSamplingPoint,
                       lng = mapSamplingPoint@coords[,1],
                       lat = mapSamplingPoint@coords[,2],
                       color = "red",
                       radius = 1,
                       group = "Sampling Points") %>%
      addCircleMarkers(data = mapSamplingSettlements,
                       lng = ~COORD_X,
                       lat = ~COORD_Y,
                       color = "red",
                       fill = FALSE,
                       fillOpacity = 0,
                       radius = 6,
                       weight = 1,
                       group = "Selected Settlements") %>%
      addLayersControl(
        overlayGroups = c("Settlements", "Sampling Grid", "Sampling Points", "Selected Settlements"),
        position = "topright",
        options = layersControlOptions(collapsed = FALSE, autoZIndex = FALSE))
  })
  #
  # Reset county grid parameters
  #
  observeEvent(input$mapSamplingPlotCountyReset, {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%      
      setView(lng = -9.429499, #geocode(location = "Liberia")[1], 
              lat = 6.428055, #geocode(location = "Liberia")[2], 
              zoom = 7)
    updateSelectInput(session = session,
      inputId = "mapSamplingAreaType",
      label = "Select area type to sample",
      choices = list("Choose one" = "",
                     "Country" = "country",
                     "County" = "county",
                     "District" = "district"),
      selected = "country")
    updateSelectInput(session = session,
      inputId = "mapSamplingCounty",
      label = "Select counties to sample",
      choices = list("Select county" = "",
                     "Counties" = counties$admin1name),
      selected = NULL)
  })
  #
  # Plot district sampling grid
  #
  observeEvent(input$mapSamplingPlotDistrict, {
    if(input$mapSamplingAreaType == "district" & input$mapSamplingSpec == "area") {
      mapSamplingPoint <- create_sp_grid(x = mapDistrict(),
                                         area = input$mapSamplingGridArea,
                                         country = "Liberia",
                                         buffer = 2)
    }
    if(input$mapSamplingAreaType == "district" & input$mapSamplingSpec == "n") {
      mapSamplingPoint <- create_sp_grid(x = mapDistrict(),
                                         n = input$mapSamplingGridNumber,
                                         country = "Liberia",
                                         buffer = 2,
                                         n.factor = 5,
                                         fixed = TRUE)
    }
    if(input$mapSamplingAreaType == "district" & input$mapSamplingSpec == "d") {
      mapSamplingPoint <- create_sp_grid(x = mapDistrict(),
                                         d = input$mapSamplingGridDist,
                                         country = "Liberia",
                                         buffer = 2)
    }
    #
    # Convert to hexagonal SpatialPolygons
    #
    mapSamplingGrid <- HexPoints2SpatialPolygons(hex = mapSamplingPoint)
    mapSamplingSettlements <- get_nearest_point(data = settlements[settlements$admin2Name == input$mapSamplingDistrict, ],
                                                data.x = "COORD_X",
                                                data.y = "COORD_Y",
                                                query = mapSamplingPoint,
                                                n = input$mapSamplingSettlementsNumber)
    #
    #
    #
    output$samplingListDownloadDistrict <- downloadHandler(
      filename = function() {
        "districtSamplingList.csv"
      },
      content = function(file) {
        write.csv(mapSamplingSettlements, file)
      }
    )
    #
    # Output data table
    #
    output$mapSamplingTable <- DT::renderDataTable(
      expr = mapSamplingSettlements,
      options = list(scrollX = TRUE)
    )
    #
    # Plot grids
    #
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%
      addPolygons(data = mapDistrict(),
                  color = "yellow",
                  weight = 6,
                  fill = FALSE) %>%
      addCircleMarkers(data = settlements,
                       lng = ~COORD_X,
                       lat = ~COORD_Y,
                       color = "darkgreen",
                       radius = 0.5,
                       group = "Settlements") %>%
      addPolygons(data = mapSamplingGrid,
                  color = "blue",
                  weight = 4,
                  fill = FALSE,
                  group = "Sampling Grid") %>%
      addCircleMarkers(data = mapSamplingPoint,
                       lng = mapSamplingPoint@coords[,1],
                       lat = mapSamplingPoint@coords[,2],
                       color = "red",
                       radius = 1,
                       group = "Sampling Points") %>%
      addCircleMarkers(data = mapSamplingSettlements,
                       lng = ~COORD_X,
                       lat = ~COORD_Y,
                       color = "red",
                       fill = FALSE,
                       fillOpacity = 0,
                       radius = 6,
                       weight = 1,
                       group = "Selected Settlements") %>%
      addLayersControl(
        overlayGroups = c("Settlements", "Sampling Grid", "Sampling Points", "Selected Settlements"),
        position = "topright",
        options = layersControlOptions(collapsed = FALSE, autoZIndex = FALSE))
  })
  #
  # Reset district grid parameters
  #
  observeEvent(input$mapSamplingPlotDistrictReset, {
    leafletProxy("mapSampling") %>%
      clearShapes() %>%
      clearMarkers() %>%
      clearControls() %>%      
      setView(lng = -9.429499, #geocode(location = "Liberia")[1], 
              lat = 6.428055, #geocode(location = "Liberia")[2], 
              zoom = 7)
    updateSelectInput(session = session,
      inputId = "mapSamplingAreaType",
      label = "Select area type to sample",
      choices = list("Choose one" = "",
                     "Country" = "country",
                     "County" = "county",
                     "District" = "district"),
      selected = "country")
    updateSelectInput(session = session,
      inputId = "mapSamplingDistrict",
      label = "Select districts to sample",
      choices = list("Select district" = "",
                     "Districts" = districts$admin2Name),
      selected = NULL)
  })
  ##############################################################################
  #
  # Collect
  #
  ##############################################################################
  #
  # PAPI
  #
  output$collectPapi <- renderUI({
    HTML("
      <p>The <strong>Liberia Coverage Survey</strong> can be implemented using paper questionnaires. A copy of the paper questionnaires can be downloaded from the following link:</p>
      <p><a target='_blank', href='forms/liberiaCoverageSurveyInstrument.pdf'><strong>Download Instrument</strong></a></p>
      <p>When using paper forms, one should use an appropriate data entry client in which to enter the information from the completed paper questionnaires. Possible data entry clients that can be used are:</p>
      <ul>
        <li><a target='_blank', href='http://www.epidata.dk'>EpiData</a></li>
        <li>EpiInfo</li>
      ")
  })
  #
  # PAPI
  #
  output$collectOdk <- renderUI({
    HTML("
      <p>The <strong>Liberia Coverage Survey</strong> can be implemented using the <a target='_blank' href='https://opendatakit.org'><strong>Open Data Kit</strong></a> digital data collection system.  The study instrument has been encoded into the electronic data entry system platform and is served from a remote server provided by <a target='_blank' href='https://ona.io'><strong>ONA</strong></a>. The remote server is provided through <a target='_blank' href='https://ona.io'><strong>ONA</strong></a> using <a target='_blank' href='http://www.validinternational.org'><strong>Valid International</strong></a>'s paid service account. A specific project called <em>Liberia Coverage Survey</em> has been created which contains the data collection forms developed for the survey.</p>

      <p>Within this project, three separate accounts/users have been created within ONA with specific access privileges corresponding to their role in relation to data management for the survey. These accounts/users are:</p>
         
      <ol>
        <li><strong>lisgis12</strong>: This account is the LISGIS account. The account was created by the LISGIS IT personnel. This account has privileges to <em>view</em> and <em>download</em> data. Account details including login details are kept by the LISGIS IT personnel.</li>
          
        <li><strong>cadnihead</strong>: This account is the survey technical team account. The technical team is composed of Abraham Zarn (UNICEF), Wesley C. Massaquoi (UNICEF) and Sando Bannel (LISGIS). This account has privileges to <em>view</em> and <em>download</em> data. Account details are kept by members of the technical team. This account can be used by members of the technical team to login to <a target='_blank' href='https://ona.io/login'><strong>ONA</strong></a> to <em>view</em> and <em>download/export</em> the available data in the remote server.</li>
         
        <li><strong>cadnisurvey</strong>: This account is the survey enumerators account. This is the account that is used to setup the <strong>ODK Collect</strong> app on the enumerators' tablets to be able to communicate with the server and submit completed and finalised forms. This account has privileges to <em>submit</em> data only. Account details are kept by members of the technical team.</li>
      </ol>

      <p>The XLSForm and XForm formats for use in digital data collection and instructions on how to use them can be obtained <a target='_blank' href='https://github.com/validmeasures/liberiaS3Mforms'><strong>here</strong></a>.</p>

      <p>For guidance on how to implement the <strong>Liberia Coverage Survey</strong> using <a target='_blank' href='https://opedatakit.org'><strong>Open Data Kit</strong></a>, see this <a target='_blank' href='https://validmeaures.org/liberiaODKguide'><strong>guide</strong></a>.
      ")
  })
  ##############################################################################
  #
  # Data processing
  #
  ##############################################################################
  #
  # Input - village data
  #
  villageData <- reactive({
    inputFile <- input$inputDataRaw1
    if(is.null(inputFile)) {
      return(NULL)
    }
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })
  #
  # Download village data
  #
  output$villageDataDownload <- downloadHandler(
    filename = function() {
      "villageData.csv"
    },
    content = function(file) {
      write.csv(villageData(), file)
    }
  )
  #
  #
  #
  observeEvent(input$inputDataAction1, {
    if(!"odkBriefcase_latest.jar" %in% list.files()) {
      get_briefcase(destination = ".")
    }
    if(input$inputOdkData1 == "remote") {
      pull_remote(target = ".",
                  id = input$inputOdkFormId1a,
                  to = ".", 
                  from = input$inputOdkUrl1,
                  username = input$inputOdkUsername1, 
                  password = input$inputOdkPassword1)
      
      export_data(target = ".",
                  id = input$inputOdkFormId1a,
                  to = "data/",
                  from = ".",
                  filename = "rawVillageData.csv",
                  overwrite = TRUE)
    }
    if(input$inputOdkData1 == "local") {
      pull_local(target = ".",
                 id = input$inputOdkFormId1b,
                 to = ".", 
                 from = ".")
      
      export_data(target = ".",
                  id = input$inputOdkFormId1b,
                  to = "data/",
                  from = ".",
                  filename = "rawVillageData.csv",
                  overwrite = TRUE)
    }
    
    villageData <- read.csv("data/rawVillageData.csv")
    
    output$villageDataTable <- DT::renderDataTable(
      expr = villageData,
      options = list(scrollX = TRUE)
    )
  })
  #
  # Output village data table - upload
  #
  observeEvent(input$inputDataRaw1, {
    output$villageDataTable <- DT::renderDataTable(
      expr = villageData(),
      options = list(scrollX = TRUE)
    )
  })
  #
  # Input - survey data
  #
  surveyData <- reactive({
    inputFile <- input$inputDataRaw2
    if(is.null(inputFile)) {
      return(NULL)
    }
    read.csv(file = inputFile$datapath, header = TRUE, sep = ",")
  })
  #
  # Download survey data
  #
  output$surveyDataDownload <- downloadHandler(
    filename = function() {
      "villageData.csv"
    },
    content = function(file) {
      write.csv(surveyData(), file)
    }
  )
  #
  # Output survey data table
  #
  output$surveyDataTable <- DT::renderDataTable(
    expr = surveyData(),
    options = list(scrollX = TRUE)
  )
  observeEvent(input$inputDataAction2, {
    if(!"odkBriefcase_latest.jar" %in% list.files()) {
      get_briefcase(destination = ".")
    }
    if(input$inputOdkData2 == "remote") {
      pull_remote(target = ".",
                  id = input$inputOdkFormId2a,
                  to = ".", 
                  from = input$inputOdkUrl2,
                  username = input$inputOdkUsername2, 
                  password = input$inputOdkPassword2)
      
      export_data(target = ".",
                  id = input$inputOdkFormId2a,
                  to = "data/",
                  from = ".",
                  filename = "rawSurveyData.csv",
                  overwrite = TRUE)
    }
    if(input$inputOdkData2 == "local") {
      pull_local(target = ".",
                 id = input$inputOdkFormId2b,
                 to = ".", 
                 from = ".")
      
      export_data(target = ".",
                  id = input$inputOdkFormId2b,
                  to = "data/",
                  from = ".",
                  filename = "rawSurveyData.csv",
                  overwrite = TRUE)
    }
    
    surveyData <- read.csv("data/rawSurveyData.csv")
    
    output$surveyDataTable <- DT::renderDataTable(
      expr = surveyData,
      options = list(scrollX = TRUE)
    )
  })
}
