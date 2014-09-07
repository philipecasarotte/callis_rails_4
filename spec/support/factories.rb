FactoryGirl.define do
  factory :event do
    name "Upcoming Event"
    happens_on Date.tomorrow
    body "This event will happen in the future. Pretty cool, eh?"
  end
  
  factory :past_event do
    name "Past Event"
    happens_on Date.yesterday
    body "This event happened in the past. You missed it."
  end
  
  factory :user do
    title "This photo is cool"
    avatar { File.new("#{Rails.root}/spec/support/fixtures/files/test.jpg") } 
  end
end