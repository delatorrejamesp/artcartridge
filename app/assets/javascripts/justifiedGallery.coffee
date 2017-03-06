$(document).on 'turbolinks:load', ->
  # $("#gallery").justifiedGallery(
  #   rowHeight: 250
  # )
  $('[data-target~=preview]').on('ajax:beforeSend', (xhr, settings) ->
      console.log("before ajax")
      return
    ).on('ajax:error', (xhr, status, error) ->
      console.log("error ajax")
      return
    ).on 'ajax:success', (data, status, xhr) ->
      $('#myModal').modal('show')
      $('[data-toggle="popover"]').popover()
