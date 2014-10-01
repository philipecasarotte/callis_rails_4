require "rails_helper"
include FeatureHelpers

feature "Event" do
  scenario "visiting Event for upcoming events logged in" do
    user = FactoryGirl.create(:user)
    login_as(user.login)
    
    event = FactoryGirl.create(:event)
    visit event_path(event)

    expect(current_path).to eql(event_path(event))
    expect(page).to have_content("This is what I want to say!")
  end
  
  scenario "visiting Event for upcoming events not logged in" do
    event = FactoryGirl.create(:event)
    visit event_path(event)

    expect(current_path).to eql(login_path)
    expect(page).to have_content("Login")
  end

  scenario "listing for past events" do
    event = FactoryGirl.create(:event)
    event.happens_on = Date.yesterday
    event.save
    user = FactoryGirl.create(:user)
    login_as(user.login)
    visit event_path(event)

    expect(current_path).to eql(event_path(event))
    expect(page).to have_content("Archived")
  end
end