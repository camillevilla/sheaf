class Own < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user #define alias for owner_id
  belongs_to :publication 
  has_many :borrows

  #want to display the owner name of a copy
  # has_one :owner, foreign_key: "user_id", source: "User"
  # has_one :work, through: :publications

  # should be able to find all copies of all editions of a single work
  # has_one :work, through: :publications
end
