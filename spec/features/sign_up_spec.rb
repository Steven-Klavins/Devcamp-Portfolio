require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  Capybara.default_driver = :selenium_chrome
  Capybara.current_driver = :selenium_chrome

  context "A user can sign up" do 
    scenario "Users can sign up" do
    visit '/register'
    fill_in "Email", with: "email@email.com"
    fill_in "Name", with: "User"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content 'Welcome'
    User.last.name.should eq('User')
    end
  end
end
