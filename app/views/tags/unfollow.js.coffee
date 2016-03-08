followButtons = $(".tag-follow-unfollow-button")
# debugger
for b in followButtons
  if b.dataset.tag == "<%= @tag.id.to_s %>"
    $(b).html("<%= j(render partial: "follow_button", locals: { tag: @tag }) %>")
    button = $(".follow-button")
    for e in button
      if e.dataset.visible == "true" then $(e).show() else $(e).hide()
