require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  Capybara.default_driver = :selenium_chrome
  Capybara.current_driver = :selenium_chrome

  before(:each) do
    User.create(
        email: "admin@admin.com",
        password: "adminpassword",
        password_confirmation: "adminpassword",
        name: "Admin User",
        roles: "site_admin"
    )
    Topic.create!(title: "Topic 1")
  end

  context "Creating and editing blogs" do 
    scenario "An admin can create a blog" do
    visit '/'
    click_on('Login')
    fill_in "user_email", with: "admin@admin.com"
    fill_in "user_password", with: "adminpassword"
    click_button "Log in"
    visit '/blogs'
    click_on('Write a New Blog')
    fill_in "blog_title", with: "Example Title"
    fill_in "blog_body", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    select "Topic 1", :from => "blog_topic_id"
    find('[name=commit]').click
    visit '/blogs'
    click_on('EXAMPLE TITLE')
    expect(page).to have_content 'Example Title'
    expect(page).to have_content "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    end

    scenario "An admin can edit a blog" do
    visit '/'
    click_on('Login')
    fill_in "user_email", with: "admin@admin.com"
    fill_in "user_password", with: "adminpassword"
    click_button "Log in"
    visit '/blogs'
    click_on('Write a New Blog')
    fill_in "blog_title", with: "Example Title"
    fill_in "blog_body", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    select "Topic 1", :from => "blog_topic_id"
    find('[name=commit]').click
    visit '/blogs'
    click_on('EXAMPLE TITLE')
    click_on('Edit')
    fill_in "blog_body" , with: "This is the updated text for the blog example!"
    find('[name=commit]').click
    visit '/blogs'
    click_on('EXAMPLE TITLE')
    expect(page).to have_content 'Example Title'
    expect(page).to have_content "This is the updated text for the blog example!"
    end
  end
end