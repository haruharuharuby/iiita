# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  markdownPreview = ->
    preview = $(".article-preview-panel")
    if preview
      # text()を取得すると空白10個がついてくる。（原因は不明。応急処置的に空白10個を取り除く。)
      text = $(".article-edit-text").val()
      text = $(".article-preview-panel").text().replace(/          /g,"") if typeof text == "undefined"
      preview.html(marked(text))
      preview.find("pre code").each (i, block) ->
        hljs.highlightBlock(block, block.className)

  markdownPreview()

  $(".article-search-text").on "focusin", (e) ->
    e.preventDefault()
    $(".article-search-button").animate(width: "show")
  $(".article-search-dropdown").on "click", (e) ->
    e.preventDefault()
    $(".article-search-dropdown-items").toggle()
  $(".article-edit-text").on 'keyup', (e) ->
    e.preventDefault()
    markdownPreview()
