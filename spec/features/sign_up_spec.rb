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
    expect(page).to have_content 'Logout'
    User.last.name.should eq('User')
    end
  end

  context "A user can sign in, log in and out" do 
    scenario "Users can sign up" do
    visit '/register'
    fill_in "Email", with: "email@email.com"
    fill_in "Name", with: "User"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_on('Logout')
    click_on('Login')
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Logout'
    end
  end

end
