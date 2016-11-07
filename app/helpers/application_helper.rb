module ApplicationHelper
  def friends?(user1_id, user2_id)
    User.find(user1_id).friends.include?(User.find(user2_id))
  end  
end
