# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'turbolinks:load', ->
  setInterval( ->
    $.ajax
      url: "admin/qoutes/random"
      type: "GET"
      dataType:　'script'
      sucess: ->
        console.log("sucessfully updated the qoutes")
  5000*10)
