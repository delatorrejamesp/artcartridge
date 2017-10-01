$(document).on 'ajax:beforeSend', ".button_to", (xhr, settings) ->
    console.log ".button_to : [before send]"
    modal_target = $(@).find("button").attr("data-target")
    $(modal_target).find(".modal-content-wrapper").hide()
    return
$(document).on 'ajax:send', ".button_to", (xhr) ->
    console.log ".button_to : [send]"
    return
$(document).on 'ajax:error', ".button_to", (xhr, status, error) ->
    console.log ".button_to : [error]"
    return
$(document).on 'ajax:success', ".button_to", (data, status, xhr) ->
    modal_target = $(@).find("button").attr("data-target")
    $(modal_target).find(".modal-content-wrapper").show()
    return
$(document).on 'ajax:complete', ".button_to", (xhr, status) ->
