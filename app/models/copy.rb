class Copy < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id",class_name: "User"
  belongs_to :edition

  validates :edition, presence: true
  validates :owner, presence: true
end
