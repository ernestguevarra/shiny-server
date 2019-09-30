################################################################################
#
# UI
#
################################################################################
## Set navbar
navbarPage(title = "Urban Youth Participatory Assessment", id = "chosenTab",
  ## Create tab panel
  tabPanel(title = "",
           value = 1,
           icon = icon(name = "home", class = "fa-lg"),
    ## Header HTML
    div(class = "outer",
      ## Header HTML
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      ## Output map
      leafletOutput("map", width = "100%", height = "100%")
    )
  )
)

