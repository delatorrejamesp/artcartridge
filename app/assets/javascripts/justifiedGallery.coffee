$(document).on 'turbolinks:load', ->
  $("#gallery").justifiedGallery(
    rowHeight: 250
  )
  # $("[data-target~=preview]").on 'click', ->
  #   photo_url = $(this).attr("data-url")
  #   $.ajax "#{photo_url}",
  #     type: 'GET'
  #     dataType: 'script'
  #     error: (jqXHR, textStatus, errorThrown) ->
  #         console.log "sorry error"
  #     success: (data, textStatus, jqXHR) ->
  #         console.log "open modal"
  #         $('#myModal').modal('show')
$ ->
  $('[data-target~=preview]').on('ajax:beforeSend', (xhr, settings) ->
      console.log("before ajax")
      return
    ).on('ajax:error', (xhr, status, error) ->
      console.log("error ajax")
      return
    ).on 'ajax:success', (data, status, xhr) ->
      $('#myModal').modal('show')
