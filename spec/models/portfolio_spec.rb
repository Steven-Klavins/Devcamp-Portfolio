require "rails_helper"

RSpec.describe Portfolio, type: :model do
  it "Saves a valid portfolio item to the database" do
    portfolio = Portfolio.new(
      title: "Portfolio title",
      subtitle: "Angular",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna 
      aliqua.",
      main_image: "https://via.placeholder.com/600x400",
      thumb_image: "https://via.placeholder.com/350x200",
    )
    expect(portfolio.title).to eq("Portfolio title")
  end
end
