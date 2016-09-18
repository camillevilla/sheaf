require 'rails_helper'

RSpec.describe Format, type: :model do

  describe "attributes" do
    it { should have_db_column(:kind) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:kind) }
  end

  describe "associations" do 
    it {should have_many(:editions)}
  end

end
