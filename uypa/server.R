################################################################################
#
# Server function
#
################################################################################
##
function(input, output, session) {
  ## Map base layer
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(
        urlTemplate = mapbox.street,
        attribution = "Map by <a href = 'http://www.mapbox.com/'>Mapbox</a>"
      ) %>%
      addMarkers(lng = diamagueneLocations$X_location_longitude,
                 lat = diamagueneLocations$X_location_latitude,
                 popup = c(paste(
                   paste("<img src='images/",
                         stringr::str_remove(string = diamagueneLocations$png,
                                             pattern = ".png"),
                         "_tn.jpg' />",sep = ""),
                   paste("<b>Infrastructure: </b>",
                         diamagueneLocations$infra,
                         sep = ""),
                   paste("<b>Description: </b>",
                         diamagueneLocations$description,
                         sep = ""),
                   sep = "<br/>"))
      ) %>%
      setView(lng = coordinates(diamaguene)[1] + 0.005,
              lat = coordinates(diamaguene)[2] + 0.005,
              zoom = 16
      )
  })
}
