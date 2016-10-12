class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_books, foreign_key: "user_id", class_name: "Copy"
  # has_many :borrowed_books, foreign_key: "user_id", class_name: "Loan"
  # rewrite these associations after thinking through borrowing and lending term

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :encrypted_password, presence: true
end
