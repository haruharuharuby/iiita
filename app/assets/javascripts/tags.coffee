$ ->
  followButtonVislble = ->
    followButtons = $(".follow-button")
    for e in followButtons
      if e.dataset.visible == "true" then $(e).show() else $(e).hide()

  document.addEventListener "turbolinks:load", ->
    followButtonVislble()
