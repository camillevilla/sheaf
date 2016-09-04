require 'bcrypt'

class User < ActiveRecord::Base
  has_many :borrows
  has_many :copies
  #define alias for borrowers
  #define alias for owners

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
