class Work < ActiveRecord::Base
  # Remember to create a migration!
  has_many :publications
end
