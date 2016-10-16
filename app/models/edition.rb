class Edition < ApplicationRecord
  belongs_to :work
  belongs_to :publisher
  # belongs_to :format
  has_many :authors, through: :work
  
  validates :work, presence: true
end
