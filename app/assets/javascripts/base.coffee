ready = ->
  followButtons = $(".follow-button")
  for e in followButtons
    if e.dataset.visible == "true" then $(e).show() else $(e).hide()

$(document).on('turbolinks:load', ready)

hljs.initHighlightingOnLoad()
