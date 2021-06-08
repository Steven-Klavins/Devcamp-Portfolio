require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do

  @user = User.create(
      email: "testuser@testuser.com",
      password: "userpassword",
      password_confirmation: "userpassword",
      name: "User"
  )

  @topic = Topic.create(title: "Topic")

  @blog = Blog.create(
    title: "My blog post",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    topic_id: @topic.id
  )
  end

  it "validate the users comment length" do
    comment = Comment.new(
      content: "Here is a valid comment from a user",
      user_id: @user.id,
      blog_id: @blog.id
    )
    expect(comment).to be_valid
  end
end
