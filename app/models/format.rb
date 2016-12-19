class Format < ApplicationRecord
  has_many :copies 

  validates :name, presence: true, uniqueness: true
end
