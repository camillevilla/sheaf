require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe "attributes" do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:copy_id) }
    it { should have_db_column(:checkout_date) }
    it { should have_db_column(:return_date) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:copy) }
    it { should validate_presence_of(:borrower) }
  end

  describe "associations" do 
    it {should belong_to(:borrower).with_foreign_key('user_id').class_name('User')}
    it {should belong_to(:copy)}
    it {should have_one(:owner).through(:copy)}
  end

end
