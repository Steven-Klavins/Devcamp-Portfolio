require 'rails_helper'

RSpec.describe Blog, type: :model do

  it "Saves a valid blog to the database" do 
    blog = Blog.new(
      title: "My blog post", 
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 
      topic_id: 1)
      expect(blog.title).to eq("My blog post")
  end
end
