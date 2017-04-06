# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ajax:beforeSend', "[data-opento~=modal]", (xhr, settings) ->
    console.log "data-opento~=modal : [before send]"
    return
  ).on('ajax:send', (xhr) ->
    console.log "data-opento~=modal : [send]"
    return
  ).on('ajax:error', (xhr, status, error) ->
    console.log "data-opento~=modal : [error]"
    return
  ).on('ajax:success', (data, status, xhr) ->
    console.log "data-opento~=modal : [success]"
    return
  ).on 'ajax:complete', (xhr, status) ->
    console.log "data-opento~=modal : [completed]"
    $('#myModal').modal 'show'
