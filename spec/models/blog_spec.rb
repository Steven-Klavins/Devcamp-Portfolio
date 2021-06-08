require "rails_helper"

RSpec.describe Blog, type: :model do

  before(:all) do
    @topic = Topic.create(id: 1, title: "Topic")
  end

  it "Saves a valid blog to the database" do
    blog = Blog.new(
      title: "My blog post",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      topic_id: @topic.id
    )
    expect(blog).to be_valid
  end

  it "Does not save a blog without a valid title" do
    blog = Blog.new(
      title: "My blog post",
      body: "",
      topic_id: 1,
    )
    expect(blog).to_not be_valid
  end

end
