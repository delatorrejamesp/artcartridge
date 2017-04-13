# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).on "click", "[data-target=expandable]", (e) ->
    e.preventDefault()
    col = $(this).attr("class")
    url = $(this).attr("data-url")
    url_med = $(this).attr("data-url-med")
    if col == "col-md-6"
      $(this).attr("class", "col-md-12")
      $(this).find("img").attr("src",url )
    else
      $(this).attr("class", "col-md-6")
      $(this).find("img").attr("src",url_med )

# $(document).on 'turbolinks:load', ->
#   # Configure infinite table
  # $('#gallery').infinitePages
  #   debug: true
  #   navSelector: "a[rel=next]"
  #   loading: ->
  #     $(".pagination").html('Loading next page...')
  #   error: ->
  #     $(this).button('There was an error, please try again')

  $("#gallery").infinitescroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "loading..."
      selector: ".loading-area"
    }
    navSelector: ".pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: ".pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#gallery div.item" # selector for all items you'll retrieve
