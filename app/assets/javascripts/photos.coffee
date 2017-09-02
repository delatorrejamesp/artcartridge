# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->

  $(".js-example-basic-multiple").select2
    theme: "bootstrap"

  $("#gallery").infinitescroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "loading..."
      selector: ".loading-area"
    }
    navSelector: ".pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: ".pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#gallery div.item" # selector for all items you'll retrieve

# $(document).on "click", "[data-target=expandable]", (e) ->
#   e.preventDefault()
#   col = $(this).attr("class")
#   url = $(this).attr("data-url")
#   url_med = $(this).attr("data-url-med")
#   if col == "col-md-6"
#     $(this).attr("class", "col-md-12").next().attr("class","").addClass("col-md-12")
#     $(this).find("img").attr("src",url)
#   else
#     $(this).attr("class", "col-md-6").next().attr("class","").addClass("col-md-6")
#     $(this).find("img").attr("src",url_med )

$(document).on "click", ".expand-icon-tool", (e) ->
  e.preventDefault()
  full_div = $(@).closest(".expandable-image")
  next_div = $(@).closest(".expandable-image").next("div")
  image = $(@).closest(".expandable-image").find("img")
  console.log($(image).attr("class"))
          # $(file_selector).attr("src","#{data['banner']}")
          # imageBanner = $(file_selector)
          # downloadingImageBanner = new Image
          # downloadingImageBanner.onload = ->
          #   imageBanner.src = @src
          #   $(file_selector).attr("style","width:100%;padding:0;margin:0;opacity:0.5;position:absolute;top:-100%;left:0;right:0;bottom:-100%;margin:auto;")
          #   return
          # downloadingImageBanner.src = data['banner']
  if $(@).find("span").hasClass("fa-expand")


    $(@).find("span").removeClass("fa-expand").addClass("fa-compress")
    #$(image).attr("src", 'https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif') #$(@).attr("data-photo-full"))
    # imageBanner = $(image)
    # downloadingImageBanner = new Image
    # downloadingImageBanner.onload = ->
    #   imageBanner.src = @src
    #   #$(image).attr("src", $(@).attr("data-photo-full"))
    #   return
    # downloadingImageBanner.src = $(@).attr("data-photo-full")
    $(image).attr("src", $(@).attr("data-photo-full"))
    if $(@).attr("data-for") == "prof-page"
      $(full_div).closest(".modal-dialog").addClass("custom-class-70")
      $(full_div).removeClass("col-md-6").addClass("col-md-12")
      $(next_div).removeClass("col-md-6").addClass("col-md-12")
    else
      $(full_div).removeClass("col-md-6").addClass("col-md-12")
      $(next_div).removeClass("col-md-6").addClass("col-md-12")
  else
    $(@).find("span").removeClass("fa-compress").addClass("fa-expand")
    $(image).attr("src", $(@).attr("data-photo-preview"))

    if $(@).attr("data-for") == "prof-page"
      $(full_div).closest(".modal-dialog").removeClass("custom-class-70")
    else
      $(full_div).removeClass("col-md-12").addClass("col-md-6")
      $(next_div).removeClass("col-md-12").addClass("col-md-6")

$(document).on "shown.bs.modal", "#bannerModal", ->
   console.log("shown.bs.modal")
  $("#gallery").infinitescroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "loading..."
      selector: ".loading-area"
    }
    navSelector: ".pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: ".pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#gallery div.item" # selector for all items you'll retrieve

$(document).on "show.bs.modal", "#bannerModal", ->
  console.log("show.bs.modal")
  $("#gallery").infinitescroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "loading..."
      selector: ".loading-area"
    }
    navSelector: ".pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: ".pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#gallery div.item" # selector for all items you'll retrieve

$(document).on "click", "[data-disabled]", ->

  if $(@).is(":checked")
    $($(@).attr("data-disabled")).prop("disabled", true)
  else
    $($(@).attr("data-disabled")).attr("disabled", false)

$(document).on "click", "[data-show]", ->

  if $(@).is(":checked")
    $($(@).attr("data-show")).show()
  else
    $($(@).attr("data-show")).hide()
