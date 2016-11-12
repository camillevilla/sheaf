class Copy < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id",class_name: "User"
  belongs_to :edition

  validates :edition, presence: true
  validates :owner, presence: true

  def available?
    Loan.where(copy_id: id, status_code: 1).empty?
  end

  def loan_pending?(current_user)
    Loan.where(borrower: current_user, copy_id: id, status_code: 0).exists?
  end

  def borrowed?
    Loan.where(copy_id: id, status_code: 1).exists?
  end

  def current_loan
    Loan.find(copy_id: id, status_code: 1)
  end

end
