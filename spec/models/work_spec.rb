require 'rails_helper'

RSpec.describe Work, type: :model do

  describe "attributes" do
    it { should have_db_column(:title) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "associations" do 
    it {should belong_to(:author)}
    it {should have_many(:editions)}
  end

end
