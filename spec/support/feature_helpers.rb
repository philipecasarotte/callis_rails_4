module FeatureHelpers
  def login_as(email)
    visit "/"
    click_link "Login/Logout"
    fill_in "login", with: email
    fill_in "password", with: "test"
    click_button "Login"
  end
end

RSPec.configure do |config|
  config.include(FeatureHelpers, type: :feature)
end