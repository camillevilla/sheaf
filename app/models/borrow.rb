class Borrow < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user #define alias for borrower_id
  belongs_to :own 
end
