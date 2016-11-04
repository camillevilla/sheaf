class Friendrequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"


  def accept_request
      Friendship.create(user_id: recipient_id, friend_id: sender_id)
      Friendrequest.find(id).update_attributes(status: 1)
  end

  # def reject_request
  #   if recipient_id == current_user.id
  #     @friendrequest.update_attribute(:status, 2)
  #   end
  # end
end
