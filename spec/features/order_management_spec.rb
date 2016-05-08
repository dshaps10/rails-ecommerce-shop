require "rails_helper"

RSpec.feature "Order management", :type => :feature do
  # before :each do

  # end

  scenario "User creates a new order" do
    visit "/users/sign_in"
    fill_in "Email", with: "dan@dan.com"
    fill_in "Password", with: 123456789
    click_button "Log in"

    visit "/products/show"
    click_button 'Add to Cart'
    expect(page).to have_text 'Your'
  end
end
