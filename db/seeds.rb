# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#user
if User.all.count == 0
	u1 = User.create!(	email: 									"sunny@yourplannr.com", 
											password: 							"nutella",
											password_confirmation: 	"nutella", 
											first_name: 						"sunny",
											last_name: 							"vempati",
										)
	u2 = User.create!(	email: 									"john@yourplannr.com", 
											password: 							"nutella",
											password_confirmation: 	"nutella", 
											first_name: 						"john",
											last_name: 							"nguyen",
										)
end

if u1.events.count == 0
	10.times.each do |e|
		event_params = 
		{
			title: 					Faker::Lorem.sentence(3),
			date: 					Faker::Number.number(2).to_i.weeks.from_now,
			guest_count: 		Faker::Number.number(2),
			min_budget: 		Faker::Number.number(3),
			max_budget: 		Faker::Number.number(4),
			location:				Faker::Address.city,
	  	details:				Faker::Lorem.paragraph,
	  	planner:				Faker::Name.name,
	  	status:  				Faker::Lorem.word,
	  	type_of_event: 	"Birthday Party",
		}

		puts event_params
		e = Event.new(event_params)
		u1.events.create(event_params) if e.valid?
	end
end

if u2.events.count == 0
	10.times.each do |e|
		event_params = 
		{
			title: 				Faker::Lorem.sentence(3),
			date: 				Faker::Number.number(2).to_i.weeks.from_now,
			guest_count: 	Faker::Number.number(2),
			min_budget: 	Faker::Number.number(3),
			max_budget: 	Faker::Number.number(4),
			location:			Faker::Address.city,
	  	details:			Faker::Lorem.paragraph,
	  	planner:			Faker::Name.name,
	  	status:  			Faker::Lorem.word,
	  	type_of_event: 	"Bachelorette Party",
		}

		e = Event.new(event_params)
		u2.events.create(event_params) if e.valid?
	end
end
