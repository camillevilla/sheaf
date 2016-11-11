class Loan < ApplicationRecord
  belongs_to :borrower, foreign_key: "user_id",class_name: "User"
  belongs_to :copy
  # don't think this is working quite right...
  # has_one :owner, through: :copy
  has_one :owner, through: :copy

  validates :copy, presence: true
  validates :borrower, presence: true

  def lend_copy
    Loan.find(id).update_attributes(status_code: 1)
  end

  def return_copy
    Loan.find(id).update_attributes(status_code: 2)
  end
end
