require 'faker'

FactoryBot.define do
  factory :company do
    name Faker::Company.name
    plan_level Company::PLAN_LEVELS.values.sample
    trial_status Faker::Date.between(300.days.ago, Date.today + 30)
  end
end
