$(document).on 'turbolinks:load', ->
  # $("#gallery").justifiedGallery(
  #   rowHeight: 250
  # )
$(document).on('ajax:beforeSend', '[data-target~=preview]', (xhr, settings) ->
    console.log("before ajax")
    return
  ).on('ajax:error', '[data-target~=preview]', (xhr, status, error) ->
    console.log("error ajax")
    return
  ).on 'ajax:success', '[data-target~=preview]', (data, status, xhr) ->
    $('#myModal').modal('show')
    $('[data-toggle="popover"]').popover()
