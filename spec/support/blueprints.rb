require 'machinist/active_record'
require 'faker'


Event.blueprint do
  title 								{ Faker::Lorem.sentence(3) }
  date									{ 4.weeks.from_now }
  guest_count						{ Faker::Number.number(2) }
  min_budget						{ 100 }
  max_budget						{ 500 }
  location							{ Faker::Address.city }
  details								{ Faker::Lorem.paragraph }
  planner								{ Faker::Name.name }
end