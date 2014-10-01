module FeatureHelpers
  def login_as(login)
    visit "/"
    click_link "Login/Logout"
    fill_in "user_session[login]", with: login
    fill_in "user_session[password]", with: "secret"
    click_button "Login"
  end
end

module Authlogic
  module TestHelper
    def create_user_session(user)
      post login_path, login: user.login, password: user.password
    end
  end
end

# Make this available to just the request and feature specs
RSpec.configure do |config|
  config.include Authlogic::TestHelper, type: :request
  config.include Authlogic::TestHelper, type: :feature
end