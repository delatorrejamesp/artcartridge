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
        @on 'success', (status, data, xhr) ->
          #@removeFile file
          console.log("data : #{JSON.stringify(data)}")
          console.log("xhr : #{JSON.stringify(xhr)}")
          console.log("status : #{JSON.stringify(status)}")
          photo = data["photo"]
          str = """
          <div class="photo item">
            <a href="#{photo['url']}">
                <img style="width: 100%;" src="#{photo['medium']}" alt="#{photo['title']}">
            </a>
            </div>
          """
          $("#gallery").prepend(str)
          $(".modal").modal('hide');
          return
        @on 'sending', (data, xhr, formData) ->
          $(form).find(":text").each ->
            formData.append $(@).attr('name'), $(@).val()
          $(form).find(":hidden").each ->
            formData.append $(@).attr('name'), $(@).val()
          $(form).find(":checkbox").each ->
              if $(@).is(":checked")
                formData.append $(@).attr('name'), $(@).val()
              else
                formData.append $(@).closest('input[type=hidden]').attr("name"), $(@).closest('input[type=hidden]').attr("name")
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
