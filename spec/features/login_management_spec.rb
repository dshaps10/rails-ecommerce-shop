require "rails_helper"

RSpec.feature "Login management", :type => :feature do

  scenario "User can log in" do
    visit "/users/sign_in"
    fill_in "Email", with: "dan@dan.com"
    fill_in "Password", with: 123456789
    click_button "Log in"
    current_path.should == user_session_path
  end
end
