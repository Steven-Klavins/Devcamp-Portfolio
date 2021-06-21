require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  Capybara.default_driver = :selenium_chrome
  Capybara.current_driver = :selenium_chrome

before(:each) do
    Capybara.reset_sessions!
    User.create(
        email: "user@user.com",
        password: "password",
        password_confirmation: "password",
        name: "User",
        roles: "user"
    ) 

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

    scenario "Users can sign up" do
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
    click_on('Logout')
    page.fill_in 'comment_content', with: "Hi here is a comment"
    find('[name=commit]').click
    expect(page).to have_content "Hi here is a comment"
    Comment.last.content.should eq('Hi here is a comment')
end
end

end