class SendCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    html = ApplicationController.render(
        partial: 'comments/comment',
        locals: {comment: comment}
    )

    ActionCable.server.broadcast "room_channel_#{comment}", comment: "hello", html: html
  end
end
