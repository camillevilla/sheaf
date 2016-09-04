class Publication < ActiveRecord::Base
  # Remember to create a migration!
  has_many :copies
  belongs_to :work
end
