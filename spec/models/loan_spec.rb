require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe "attributes" do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:copy_id) }
    it { should have_db_column(:status_code) }
    it { should have_db_column(:checkout_date) }
    it { should have_db_column(:return_date) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:copy) }
    it { should validate_presence_of(:borrower) }
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:status_code) }
  end

  describe "associations" do 
    it {should belong_to(:borrower).with_foreign_key('user_id').class_name('User')}
    it {should belong_to(:copy)}
    it {should have_one(:owner).through(:copy)}
  end

  describe "methods" do

    it "updates status code after checking out copy" do
      loan = FactoryGirl.build(:loan)
      expect{loan.lend_copy}.to change{loan.status_code}.from(0).to(1)
    end  

    it "updates status code for returned loans" do
      loan = FactoryGirl.build(:loan)
      expect{loan.return_copy}.to change{loan.status_code}.to(2)
    end
  
  end

end
