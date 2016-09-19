class Loan < ApplicationRecord
  belongs_to :borrower, foreign_key: "user_id",class_name: "User"
  belongs_to :copy
  has_one :owner, through: :copy

  validates :copy, presence: true
  validates :borrower, presence: true
end
