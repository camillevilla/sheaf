require 'rails_helper'

RSpec.describe Author, type: :model do


  describe "attributes" do
    it "has a name" do 
      expect(build(:author).name).to eq "Toni Morrison"
    end
  end

  describe "associations" do
      it {should have_many(:works)}
      it {should have_many(:editions).through(:works)}
  end

  describe "validations" do
    it "is valid with a name" do
      expect(build(:author)).to be_valid
    end

    it "is invalid without a name" do
      invalid_author = build(:author, name: nil)
      expect(invalid_author.valid?).to be false
    end
  end

end