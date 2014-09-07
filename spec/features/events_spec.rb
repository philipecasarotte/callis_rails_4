require "rails_helper"

feature "Event" do
  scenario "visiting Event for upcomign events" do
    event = FactoryGirl.create(:event)
    visit event_path(event)

    expect(current_path).to eql(event_path(event))
    expect(page).to have_content("This is what I want to say!")
  end

  scenario "listing for past events" do
    event = FactoryGirl.create(:past_event)
    visit event_path(event)

    expect(current_path).to eql(event_path(event))
    expect(page).to have_content("Archived")
  end
end