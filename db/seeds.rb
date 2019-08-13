# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do 
  faker_first_name = Faker::Name.first_name
  pwd = Faker::Internet.password
  user = User.create!(first_name: faker_first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: "#{faker_first_name.downcase}@yopmail.com", password: pwd, password_confirmation: pwd)
end
puts "5 utilisateurs ont été générés"

10.times do 
  event = Event.create!(start_date: Faker::Date.forward(days: 365), duration: rand(1..20) * 5, title: Faker::Book.title, description: "Cet événement attend de recevoir une description.", price: rand(1..100) * 10, location: Faker::Address.city, event_planner_id: User.find(rand(1..5)).id )
end
puts "10 événéments ont été générés"

(1..10).each do |i|
  while Attendance.where(event_id: i).empty? == true
    attendance = Attendance.create!(user: User.find(rand(1..5)), event: Event.find(rand(1..10)) )
  end
end
puts "10 attendances ont été générés"
