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

end
