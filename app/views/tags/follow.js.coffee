$(".tag-follow-unfollow-button").html("<%= j(render partial: "follow_button", locals: { tag: @tag }) %>")
followButtons = $(".follow-button")
for e in followButtons
  if e.dataset.visible == "true" then $(e).show() else $(e).hide()
