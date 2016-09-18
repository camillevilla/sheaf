require 'rails_helper'

RSpec.describe Publisher, type: :model do

  describe "attributes" do
    it { should have_db_column(:name) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do 
    it {should have_many(:editions)}
    it {should have_many(:works).through(:editions)}
    it {should have_many(:authors).through(:works)}
  end

end
