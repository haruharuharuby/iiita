ready = ->
  $(".comment-preview-button").on "click", (e)->
    e.preventDefault()
    text = $("textarea#comment-edit-text").val()
    markedText = marked(text)
    $(".comment-preview-panel").html(markedText)
    $(".comment-preview-panel").find("pre code").each (i, block) ->
      hljs.highlightBlock(block, block.className)

  comments = $(".single-comment-body")
  for c in comments
    text = $(c).text().replace(/              /g,"")
    markedText = marked(text)
    $(c).html(markedText)
    $(c).find("pre code").each (i, block) ->
      hljs.highlightBlock(block, block.className)

$(document).on('turbolinks:load', ready)
