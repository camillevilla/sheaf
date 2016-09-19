class User < ApplicationRecord
  has_many :owned_books, foreign_key: "user_id", class_name: "Copy"
  # has_many :borrowed_books, foreign_key: "user_id", class_name: "Loan"
  # rewrite these associations after thinking through borrowing and lending term

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :password, presence: true
end
