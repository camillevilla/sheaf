class Author < ApplicationRecord
  has_many :works
  has_many :editions, through: :works
  accepts_nested_attributes_for :works
  validates :name,
    presence: true,
    uniqueness: true
end
