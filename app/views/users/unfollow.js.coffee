followButtons = $(".follow-unfollow-button")
for b in followButtons
  if b.dataset.objectid == "<%= @user.id.to_s %>"
    $(b).html("<%= j(render partial: "follow_button", locals: { user: @user }) %>")
    button = $(".follow-button")
    for e in button
      if e.dataset.visible == "true" then $(e).show() else $(e).hide()
