# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class InfoBoxBuilder extends Gmaps.Google.Builders.Marker # inherit from base builder
  # override method
  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute('class', 'marker_container') #to customize
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

    # add @bind_infowindow() for < 2.1

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"
      height: "280px"

@buildMap = (markers)->
  handler = Gmaps.build 'Google', { builders: { Marker: InfoBoxBuilder} }

  #then standard use
  handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
    markers = handler.addMarkers(markers)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()

