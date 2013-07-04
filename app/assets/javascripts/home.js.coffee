# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

searchTable = (inputVal) ->
  table = $(".thumbnails")
  table.find("li").each (index, row) ->
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

