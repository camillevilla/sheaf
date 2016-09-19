require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do
    it { should have_db_column(:name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:phone) }
    it { should have_db_column(:password) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:password) }
  end

  describe "associations" do 
    it {should have_many(:owned_books).with_foreign_key('user_id').class_name('Copy')}
    # it {should have_many(:borrowed_books).with_foreign_key('user_id').class_name('Loan')}
  end

end
