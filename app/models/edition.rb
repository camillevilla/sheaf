class Edition < ApplicationRecord
  belongs_to :work
  belongs_to :publisher
  has_many :authors, through: :work
  
  validates :work, presence: true


end
