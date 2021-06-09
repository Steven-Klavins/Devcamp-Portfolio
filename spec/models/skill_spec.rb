require 'rails_helper'

RSpec.describe Skill, type: :model do
  it "validates presence of skill title" do
    skill = Skill.new(
      title: "",
      percent_utilized: 15,
    )
    expect(skill).to_not be_valid
  end

  it "validates presence of skill percent" do
    skill = Skill.new(
      title: "Title"
    )
    expect(skill).to_not be_valid
  end

  it "creates a valid skill" do
    skill = Skill.new(
      title: "Title",
      percent_utilized: 15
    )
    expect(skill).to be_valid
  end
end
