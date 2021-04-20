module NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    @visiter_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"があなたをフォローしました"
      when "good" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_content_path(notification.post_content_id))+"にいいねしました"
      when "comment" then
          @comment = Comment.find_by(id: @visiter_comment)&.comment
          tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_content_path(notification.post_content_id))+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
