class Own < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user #define alias for owner_id
  belongs_to :publication 
  has_many :borrows

end
