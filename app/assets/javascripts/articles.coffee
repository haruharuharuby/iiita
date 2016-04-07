markdownPreview = ->
  preview = $(".article-preview-panel")
  if preview
    # text()を取得すると空白10個がついてくる。（原因は不明。応急処置的に空白10個を取り除く。)
    text = $(".article-edit-text").val()
    text = $(".article-preview-panel").text().replace(/          /g,"") if typeof text == "undefined"
    preview.html(marked(text))
    preview.find("pre code").each (i, block) ->
      hljs.highlightBlock(block, block.className)

ready = ->
  $(".article-edit-text").on 'keyup', (e) ->
    e.preventDefault()
    markdownPreview()
  # visualize tag operation initialized when browzer history reloaded by turbolinks.
  $(".input-tag-list").tagsinput()

$(document).on('turbolinks:load', ready)
