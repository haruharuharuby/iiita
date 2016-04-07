ready = ->
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

$(document).on('turbolinks:load', ready)
