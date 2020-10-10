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
puts 'Creating seed organiser'
organiser = Contact.create(name: 'Oscar Edel', email: 'edeloscar@gmail.com')
avatar_img = URI.open('https://avatars0.githubusercontent.com/u/30212388?s=460&u=5e05701e2830ddd55ccd5408ed0b7f7151ff257d&v=4')
organiser.image.attach(io: avatar_img, filename: 'oscar.png', content_type: 'image/png')
puts "Created organiser-contact with id: #{organiser.id}"

puts ""
puts 'Creating seed event...'
event = Event.create(name: "30th🙀 Birthday party",
                     starts_at: Time.new(2020,6,18,21,59),
                     location: "At my place",
                     description: "Let's celebrate my 30th year with a banger!! This will be my first birthday party in a long time, so I want it to be the biggest of the year. Who will get the champagne and bitterballs?",
                     contact_id: organiser.id)

# Attach an image to the event
balloons_img = URI.open('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
event.image.attach(io: balloons_img, filename: 'balloons.png', content_type: 'image/png')
puts "Created event with id: #{event.id}"


puts ""
puts 'Creating seed responses for this event...'

contact = Contact.create(name: 'Oscaro', email: 'edeloscar@gmail.com')
response = Response.create(attendance: 1,
                           message: "I'll be there",
                           event_id: event.id,
                           contact_id: contact.id)
puts "Created #{response.attendance} response with id: #{response.id}, for contact: #{response.contact.id}"

contact = Contact.create(name: 'Stijn', email: 'stijn@gmail.com')
response = Response.create(attendance: 1,
                           message: "Party on!!",
                           event_id: event.id,
                           contact_id: contact.id)
puts "Created #{response.attendance} response with id: #{response.id}, for contact: #{response.contact.id}"

contact = Contact.create(name: 'Jochem', email: 'jochem@gmail.com')
response = Response.create(attendance: 2,
                           message: "Cool! I'll let you know.",
                           event_id: event.id,
                           contact_id: contact.id)
puts "Created #{response.attendance} response with id: #{response.id}, for contact: #{response.contact.id}"


contact = Contact.create(name: 'Kamiel', email: 'kamiel@gmail.com')
response = Response.create(attendance: 0,
                           message: "Damn, can't make it!",
                           event_id: event.id,
                           contact_id: contact.id)
puts "Created #{response.attendance} response with id: #{response.id}, for contact: #{response.contact.id}"


puts ""
puts 'Finished seeds!'
