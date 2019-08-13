# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all

30.times do 
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@yopmail.com"
	User.create(email: email, encrypted_password: Faker::Internet.password,
description: Faker::Lorem.characters, first_name: first_name, last_name: last_name)
end

5.times do
	e = Event.new(start_date: Faker::Time.forward(days: 23),
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.words, price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
	until e.save
		e = Event.new(start_date: Faker::Time.forward(days: 23),
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.words, price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
	end
end

50.times do
	a = Attendance.new(user: User.all.sample, attended_event: Event.all.sample)
	until a.save
		a = Attendance.new(user: User.all.sample, attended_event: Event.all.sample)
	end
end