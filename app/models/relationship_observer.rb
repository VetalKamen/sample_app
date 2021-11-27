class RelationshipObserver < ActiveRecord::Observer

  def after_create(relationship)
    current_user = User.find(relationship.follower_id)
    followed_user = User.find(relationship.followed_id)
    text = "#{current_user.name} has just followed You!"
    Notification.create(user_id: followed_user.id, target_id: current_user.id, text: text)
  end

end