class Friendrequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"


  def accept_request
    if recipient_id == current_user.id
    end
  end

  def reject_request
    if recipient_id == current_user.id
    end
  end
end
