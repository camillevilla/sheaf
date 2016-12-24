require 'rails_helper'

RSpec.describe Copy, type: :model do

  describe "attributes" do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:acquisition_date) }
    it { should have_db_column(:url) }
    it { should have_db_column(:edition_id) }
    it { should have_db_column(:format_id) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:edition) }
    it { should validate_presence_of(:owner) }
  end

  describe "associations" do 
    it {should belong_to(:owner).with_foreign_key('user_id').class_name('User')}
    it {should belong_to(:edition)}
    it {should belong_to(:format)}
  end

  describe "methods" do

    it "copy is available to borrow" do 
      copy = FactoryGirl.build(:copy)
      expect(copy.available?).to eq true
    end

    it "user has requested copy from a friend" do 
      copy = FactoryGirl.create(:copy, user_id: 2)
      loan = FactoryGirl.create(:loan, copy_id: copy.id, user_id: 1, status_code: 0)
      expect(copy.requested?(User.find(1))).to eq true
    end

    it "pending request for copy owner by user" do
      copy = FactoryGirl.create(:copy, user_id: 2)
      loan = FactoryGirl.create(:loan, copy_id: copy.id, user_id: 1, status_code: 0)
      expect(copy.loan_pending?).to eq true
    end

    it "user's copy is being borrowed" do
      copy = FactoryGirl.create(:copy, user_id: 2)
      loan = FactoryGirl.create(:loan, copy_id: copy.id, user_id: 1, status_code: 1)
      expect(copy.borrowed?).to eq true
    end

  end
end
