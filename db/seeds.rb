require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting Seeds"
puts ""

puts 'Creating seed event...'
event = Event.create(name: "Birthday party",
                     date_time: DateTime.new(2020,9,1,17),
                     location: "At my place",
                     description: "Let's celebrate my 30th year with a banger!!",
                     organiser_name: "Oscar Edel",
                     organiser_email: "edeloscar@gmail.com")

# Attach an image to the event
balloons_img = URI.open('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
event.image.attach(io: balloons_img, filename: 'balloons.png', content_type: 'image/png')

puts "Created event with id: #{event.id}"


puts ""
puts 'Creating seed responses for this event...'

response = Response.create(attendance: 1,
                           name: "Oscaro",
                           message: "I'll be there",
                           email: "edeloscar@gmail.com",
                           event_id: event.id)
puts "Created #{response.attendance} response with id: #{response.id}"

response = Response.create(attendance: 1,
                           name: "Stijn",
                           message: "Party on!!",
                           email: "stijn@gmail.com",
                           event_id: event.id)
puts "Created #{response.attendance} response with id: #{response.id}"

response = Response.create(attendance: 2,
                           name: "Jochem",
                           message: "Cool, checking agenda!",
                           email: "jochem@gmail.com",
                           event_id: event.id)
puts "Created #{response.attendance} response with id: #{response.id}"

response = Response.create(attendance: 0,
                           name: "Kamiel",
                           message: "Damn, can't make it!",
                           email: "kamiel@gmail.com",
                           event_id: event.id)
puts "Created #{response.attendance} response with id: #{response.id}"


puts ""
puts 'Finished seeds!'
