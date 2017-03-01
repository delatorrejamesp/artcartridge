dropzoneFunc = () ->
  Dropzone.autoDiscover = false
  if parseInt($(".dropzone").length) > 0
    console.log("initialize")
    dropzone = new Dropzone '.dropzone',
      maxFilesize: 256
      paramName: 'photo[image]'
      addRemoveLinks: false
    dropzone.on 'success', (file) ->
      @removeFile file
      console.log(file)
      $.getScript '/photos'
      return
$(document).on 'turbolinks:load', dropzoneFunc

$(document).on 'turbolinks:load', ->

  $('[data-target~=uploaded]').on('ajax:beforeSend', (xhr, settings) ->
    console.log 'before ajax'
    return
  ).on('ajax:error', (xhr, status, error) ->
    console.log 'error ajax'
    return
  ).on('ajax:success', (data, status, xhr) ->
    $('#myModal').modal 'show'
    return
  ).on 'ajax:complete', (xhr, status) ->
    dropzoneFunc
    console.log("hello"+$(".dropzone").length)
    #$('#myModal').modal 'show'
    Dropzone.autoDiscover = false
    if parseInt($(".dropzone").length) > 0
      console.log("initialize")
      dropzone = new Dropzone '.dropzone',
        maxFilesize: 256
        paramName: 'photo[image]'
        addRemoveLinks: false
      dropzone.on 'success', (file) ->
        @removeFile file
        console.log(file)
        $.getScript '/photos'
        return
    return
