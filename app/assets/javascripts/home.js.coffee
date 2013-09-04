# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

searchTable = (inputVal) ->
  table = $(".thumbnails")
  table.find(".thumbnail").each (index, row) ->
    allCells = $(row).find("span")
    if allCells.length > 0
      found = false
      allCells.each (index, td) ->
        regExp = new RegExp(inputVal, "i")
        if regExp.test($(td).text())
          found = true
          false

      if found is true
        $(row).show()
      else
        $(row).hide()

window.searchTable = searchTable



initialize = ->
  mapOptions =
    zoom: 15
    mapTypeId: google.maps.MapTypeId.ROADMAP
    center: new google.maps.LatLng(20.62138, -103.41670)

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  marker = new google.maps.Marker(
    map: map
    draggable: true
    animation: google.maps.Animation.DROP
    position: new google.maps.LatLng(20.62138, -103.41670)
  )
  window.marker = marker
  window.map = map

  google.maps.event.addListener marker, "drag", ->
    updateMarkerPosition marker.getPosition()

toggleBounce = ->
  if marker.getAnimation()?
    marker.setAnimation null
  else
    marker.setAnimation google.maps.Animation.BOUNCE




window.initialize = initialize
window.toggleBounce = toggleBounce