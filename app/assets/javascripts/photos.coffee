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

$(document).on "click", "[data-target=expandable]", (e) ->
  e.preventDefault()
  col = $(this).attr("class")
  url = $(this).attr("data-url")
  url_med = $(this).attr("data-url-med")
  if col == "col-md-6"
    $(this).attr("class", "col-md-12").next().attr("class","").addClass("col-md-12")
    $(this).find("img").attr("src",url)
  else
    $(this).attr("class", "col-md-6").next().attr("class","").addClass("col-md-6")
    $(this).find("img").attr("src",url_med )

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
