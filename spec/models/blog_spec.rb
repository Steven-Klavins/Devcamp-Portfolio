require "rails_helper"

RSpec.describe Blog, type: :model do

  before(:each) do
    @topic = Topic.create(title: "Topic")
  end

  it "lets the user create a valid blog" do
    blog = Blog.new(
      title: "My blog post",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      topic_id: @topic.id
    )
    expect(blog).to be_valid
  end

  it "does not let a user create a blog without a valid title" do
    blog = Blog.new(
      title: "My blog post",
      body: "",
      topic_id: 1,
    )
    expect(blog).to_not be_valid
  end

end
