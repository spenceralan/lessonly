require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it { should belong_to :company }

  it { should validate_presence_of :name }

  it do
    should allow_values(
      "hello",
      "TEST",
      "lesson1",
      "8",
      "apéritif",
      "пингвин"
    ).for(:name)
  end

  it do
    should_not allow_values(
      "*&^%$",
      "hello world",
      "valid!!!!",
      "   "
    ).for(:name)
  end
end
