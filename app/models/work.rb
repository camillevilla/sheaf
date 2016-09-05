class Work < ActiveRecord::Base
  # Remember to create a migration!
  has_many :publications
  has_many :owns, through: :publications
end
