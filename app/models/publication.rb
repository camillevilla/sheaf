class Publication < ActiveRecord::Base
  # Remember to create a migration!
  has_many :owns
  belongs_to :work
end
