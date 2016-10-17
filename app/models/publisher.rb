class Publisher < ApplicationRecord
  has_many :editions
  has_many :works, through: :editions
  has_many :authors, through: :works

  validates :name, 
    presence: true,
    uniqueness: true
end
