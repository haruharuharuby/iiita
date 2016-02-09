# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".landing-login-form").css("display","block")
  $(".landing-signup-form").css("display","none")

  $(".sign-up-toggle-link").on "click", (e) ->
    e.preventDefault()
    $(".landing-login-form").css("display","none")
    $(".landing-signup-form").css("display","block")

  $(".cancel-new-user-link").on "click", (e) ->
    e.preventDefault()
    $(".landing-login-form").css("display","block")
    $(".landing-signup-form").css("display","none")
