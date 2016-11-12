class Loan < ApplicationRecord
  belongs_to :borrower, foreign_key: "user_id",class_name: "User"
  belongs_to :copy
  has_one :owner, through: :copy

  validates :copy, presence: true
  validates :borrower, presence: true
  validates :owner, presence: true
  validates :status_code, presence: true

  def lend_copy
    update_attributes(status_code: 1)
  end

  def return_copy
    update_attributes(status_code: 2)
  end
end
