require "rails_helper"

RSpec.describe "Application routing", :type => :routing do
  it do
    should route(:get, '/').
      to(controller: :demo, action: :welcome)
  end
end