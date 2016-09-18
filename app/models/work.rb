class Work < ApplicationRecord
  belongs_to :author
  has_many :editions
  validates :title, presence: true
end
