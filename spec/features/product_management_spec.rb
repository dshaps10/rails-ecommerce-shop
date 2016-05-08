require "rails_helper"

RSpec.feature "Product management", :type => :feature do
  before :each do
      @test_product = Product.create(:name => 'Test', :description => 'test description', :list_price => 7, :quantity => 7)
  end
  scenario "Admin creates a new product" do
    page.driver.browser.authorize "admin", "secret"
    visit "/products/new"

    fill_in "product[name]", :with => "My Product"
    fill_in "product[description]", :with => "Product description"
    fill_in "product[list_price]", :with => "5"
    fill_in "product[quantity]", :with => "10"
    click_button "Save Product"

    expect(page).to have_text("You successfully listed your product!")
  end

  scenario "Admin doesn't create a new product" do
    page.driver.browser.authorize "admin", "secret"
    visit "/products/new"

    fill_in "product[name]", :with => "My Product"
    fill_in "product[description]", :with => "Product description"
    fill_in "product[list_price]", :with => "5"
    fill_in "product[quantity]", :with => ""
    click_button "Save Product"

    expect(page).to have_text("Sorry, we weren't able to list your product")
  end

  scenario "Admin edits a current product" do
    page.driver.browser.authorize "admin", "secret"
    puts @test_product.inspect
    visit edit_product_path(@test_product)

    fill_in "product[name]", :with => "My Product"
    click_button "Save Product"
  end
end
