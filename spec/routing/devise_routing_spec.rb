RSpec.describe "Devise", :type => :routing do
  describe "registrations" do
    it "routes GET /users/sign_up to users/registrations#sign_up" do
      expect(:get => "/users/sign_up").to route_to("users/registrations#new")
    end

    it "routes POST /users to users#create" do
      expect(:post => "/users").to route_to("users/registrations#create")
    end

    it "routes GET /users/edit to users/registrations#edit" do
      expect(:get => "/users/edit").to route_to("users/registrations#edit")
    end

    it "routes PUT /users to users#update" do
      expect(:put => "/users").to route_to("users/registrations#update")
    end

    it "routes DELETE /users to users/registrations#destroy" do
      expect(:delete => "/users").to route_to("users/registrations#destroy")
    end
  end

  describe "sessions" do
    it "routes GET /users/sign_in to users/sessions#new" do
      expect(:get => "/users/sign_in").to route_to("users/sessions#new")
    end

    it "routes POST /users/sign_in to sessions#create" do
      expect(:post => "/users/sign_in").to route_to("users/sessions#create")
    end

    it "routes DELETE /users/sign_out to sessions#destroy" do
      expect(:delete => "/users/sign_out").to route_to("users/sessions#destroy")
    end

  end
end