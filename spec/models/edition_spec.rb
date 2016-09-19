require 'rails_helper'

RSpec.describe Edition, type: :model do

  describe "attributes" do
    it { should have_db_column(:work_id) }
    it { should have_db_column(:publisher_id) }
    it { should have_db_column(:publication_year) }
    it { should have_db_column(:format_id) }
    it { should have_db_column(:isbn10) }
    it { should have_db_column(:isbn13) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:work) }
  end

  describe "associations" do 
    it {should belong_to(:work)}
    it {should belong_to(:publisher)}
    it {should belong_to(:format)}
    it {should have_many(:authors).through(:work)}
  end

end
