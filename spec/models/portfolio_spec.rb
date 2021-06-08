require "rails_helper"

RSpec.describe Portfolio, type: :model do
  it "lets the user create a valid portfolio item" do
    portfolio = Portfolio.new(
      title: "Portfolio title",
      subtitle: "Angular",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna 
      aliqua.",
      main_image: "https://via.placeholder.com/600x400",
      thumb_image: "https://via.placeholder.com/350x200",
    )
    expect(portfolio).to be_valid
  end

  it "does not let a user create portfolio item without a valid title" do
    portfolio = Portfolio.new(
      title: "",
      subtitle: "Angular",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna 
      aliqua.",
      main_image: "https://via.placeholder.com/600x400",
      thumb_image: "https://via.placeholder.com/350x200",
    )
    expect(portfolio).to_not be_valid
  end
end
