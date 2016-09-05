require 'bcrypt'

class User < ActiveRecord::Base
  has_many :borrows
  has_many :owns
  #define alias for borrowers
  #define alias for owners

  #todo / should be able to make calls for:
  #first level
      # all copies owned by a user
      # all copies borrowed by a user

  include BCrypt
  # Remember to create a migration!

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
