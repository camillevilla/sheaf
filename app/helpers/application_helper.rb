module ApplicationHelper
  def friends?(user1_id, user2_id)
    User.find(user1_id).friends.include?(User.find(user2_id))
  end

  def access_authorized?(user)
    (user == current_user) || friends?(user.id, current_user.id)
  end
end
