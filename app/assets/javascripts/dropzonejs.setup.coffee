window.App ||= {}

App.initialize_dropzone = ->
  Dropzone.autoDiscover = false
  form = $("[data-form=photo]")
  AUTH_TOKEN=$('meta[name="csrf-token"]').attr('content');
  if parseInt($(".dropzone-photo").length) > 0
    dropzone = new Dropzone '.dropzone-photo',
      paramName: 'photo[image]'
      params:
        authenticity_token:  AUTH_TOKEN
      uploadMultiple: false
      url: form.attr("action")
      acceptedFiles: "image/*"
      autoProcessQueue: false
      thumbnailWidth: null
      thumbnailHeight: null
      #previewTemplate: '<div style="display:none"></div>'
      init: ->
        dzClosure = @
        $(form).find(":submit").on "click", (e)->
          if dzClosure.getQueuedFiles().length > 0
            e.preventDefault()
            e.stopPropagation()
            dzClosure.processQueue()
          return
        @on 'success', (file) ->
          #@removeFile file
          #console.log(file)
          # $.getScript '/photos'
          return
        @on 'sending', (data, xhr, formData) ->
          $(form).find(':input:not(:file)').each ->
           if $(@).is("[name]")
             formData.append $(@).attr('name'), $(@).val()
       previewTemplate: '<div style="display:none"></div>'
       thumbnail: (file, dataUrl)->
         $('.dz-message').hide()
         $(form).find("[data-thumbnail=photo]").attr("style","background-image: url('#{dataUrl}');height: 250px;background-size: 100% 100%;")


$(document).on 'turbolinks:load', ->
  App.initialize_dropzone()

$(document).on('ajax:beforeSend','[data-target~=uploaded]', (xhr, settings) ->
    console.log 'before ajax'
    return
  ).on('ajax:error', (xhr, status, error) ->
    console.log 'error ajax'
    return
  ).on('ajax:success', (data, status, xhr) ->
    $('#myModal').modal 'show'
    return
  ).on 'ajax:complete', (xhr, status) ->
    App.initialize_dropzone()
