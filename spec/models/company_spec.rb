require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many :lessons }

  it { should validate_presence_of :name }
  it { should validate_presence_of :plan_level }
  it { should validate_presence_of :trial_status }

  it {should validate_length_of(:name).is_at_least(2) }
  it {should validate_length_of(:name).is_at_most(255) }

  it { should define_enum_for(:plan_level).with(Company::PLAN_LEVELS.keys) }
end
