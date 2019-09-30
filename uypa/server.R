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
      addMiniMap(tile = mapbox.satellite,
                 toggleDisplay = TRUE) %>%
      addMarkers(lng = diamagueneLocations$X_location_longitude,
                 lat = diamagueneLocations$X_location_latitude,
                 popup = create_popup_content(df = diamagueneLocations),
                 clusterOptions = markerClusterOptions()
      ) %>%
      setView(lng = coordinates(diamaguene)[1] + 0.005,
              lat = coordinates(diamaguene)[2] + 0.005,
              zoom = 16
      )
  })
}
