# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Company.delete_all

25.times do
  Company.create(
    name: Faker::Company.name,
    plan_level: Company::PLAN_LEVELS.values.sample,
    trial_status: Faker::Date.between(300.days.ago, Date.today + 30)
  )
end