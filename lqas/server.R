################################################################################
#
# Server function
#
################################################################################
##
function(input, output, session) {
  #
  ##############################################################################
  ## INPUTS
  ##############################################################################
  ## Input for dUpper
  #output$dUpper <- renderUI({
  #  req(input$dLower)
    #dUpperDefault <- input$dLower + 30
  #  sliderInput(inputId = "dUpper",
  #              label = "Upper triage threshold (%)",
  #              value = input$dLower + 30,
  #              min = input$dLower + 30,
  #              max = 100)
  #})
  ##
  observeEvent(input$dUpper - input$dLower < 30, {
    showNotification(session = session,
                     ui = "Lower triage and upper triage threshold have a narrow gap. Continue if this is correct or change parameters.",
                     type = "error")
  })
  
  
  ##############################################################################
  ## Simulation
  ##############################################################################
  ## Simulate
  x <- eventReactive(input$runTest, {
    validate(
      need(input$dLower < input$dUpper, "Lower triage threshold should be less than upper triage threshold.")
    )
    
    validate(
      need(input$dUpper > input$dLower, "Upper triage threshold should be more than lower triage threshold.")
    )
    
    ## Create concatenating object for replicate simulations
    x <- NULL
    replicates <- 20
    ## Create progress bar
    withProgress(message = "Running simulations", value = 0, {
      ## Cycle through number of replicate simulations
      for(i in 1:replicates) {
        x <- rbind(x, simul_lqas(pop = input$populationSize,
                                 n = input$sampleSize,
                                 d.lower = input$dLower,
                                 d.upper = input$dUpper,
                                 p.lower = 0,
                                 p.upper = 100,
                                 fine = 1,
                                 progress = TRUE))
        incProgress(1/replicates, detail = paste("Running simulation replicate number:", i, "of 20", sep = " "))
      }
    })
    ##
    x <- list(x, input$dLower, input$dUpper, 0, 100)
    names(x) <- c("x", "d.lower", "d.upper", "p.lower", "p.upper")
    ##
    class(x) <- "lqasSim"
    ##
    return(x)
    ## Perform simulation
    #test_lqas_classifier(pop = input$populationSize,
    #                     n = input$sampleSize,
    #                     d.lower = input$dLower,
    #                     d.upper = input$dUpper)
  })
  ## Calculate probabilities
  y <- reactive({
    req(x())
    df <- get_class_prob(x = x())
    z <- data.frame(
      Classification = c("Low", "Moderate", "High",
                         "Overall", "Gross misclassification"),
      Probability = c(round(df$probs, 6))
    )
  })
  ##
  ##############################################################################
  ## Output
  ##############################################################################
  ## Table
  output$probClassTable <- renderTable({
    y()
  })
  ## Plot
  output$probClassPlot <- renderPlot({
    req(x())
    plot(x = x())
  })
}
