class Format < ApplicationRecord
  # has_many :editions
  validates :kind, presence: true
end
