# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".article-search-button").hide()
  $(".article-search-dropdown-items").hide()
  $(".article-search-text").on "focusin", ->
    $(".article-search-button").animate(width: "show")
  $(".article-search-dropdown").on "click", ->
    $(".article-search-dropdown-items").toggle()
