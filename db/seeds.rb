# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'example@mail.com',
             password: 'foobar',
             password_confirmation: 'foobar')

20.times do |i|
  name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  email = Faker::Internet.email(name: 'test bot', separators: '{i + 1}')
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
  puts "Created #{i} users..."
end

users = User.all.order(created_at: :desc).limit(21)
users_reorder = User.all.limit(21)

def rand_date(n)
  int = rand(-n..n)
  Date.today + int
end

10.times do |i|
  date = rand_date(i)
  location = Faker::Address.street_address + ', ' + Faker::Address.city
  description = Faker::Lorem.sentence(5)
  users.each do |u|
    u.events.create!(date: date,
                     location: location,
                     description: description)
  end
  puts "Created 10 events for user #{i}..."
end

200.times do |_i|
  users_reorder.each do |u|
    rand_gen_attendees = rand(1..200)
    u.user_events.create!(event_id: rand_gen_attendees)
  end
end
