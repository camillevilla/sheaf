require 'rails_helper'

RSpec.describe Format, type: :model do
  describe "attributes" do
    it { should have_db_column(:name) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should have_many(:copies)}
  end
end
