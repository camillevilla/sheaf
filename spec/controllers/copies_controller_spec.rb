require 'rails_helper'

RSpec.describe CopiesController, type: :controller do
  include Devise::Test::ControllerHelpers
  before do
    sign_in(FactoryGirl.create(:user))
  end
  describe "POST #create" do
    it "assigns the newly created author as @author" do
      post :create, { author: {name: "Jane Austen"}, work: {title: "Pride and Prejudice"}, publisher: {name: "Oxford"}, edition: {publication_year: 1876}, copy: {url: "http://wikipedia.org"}}
      expect(assigns(:author)).to eq Author.last
    end

  end
end
