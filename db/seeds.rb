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
                     description: "Hi party people,✌️\n
                                   Let's celebrate my 30th year with a banger!💥  This will be my first birthday party in a long time, so I want it to be the biggest of the year.
                                   Bring your own booze. Who will get the champagne and bitterballs? And can we also get some 🍕🍕?\n
                                   See you soon!",
                     contact_id: organiser.id)

# Attach an image to the event
confetti_img = URI.open('https://media.npr.org/assets/img/2012/03/01/pxd-005461rv4a2_wide-37bf7de22cdef405c380c854f3744edbabd1cc41.jpg')
event.image.attach(io: confetti_img, filename: 'confetti.png', content_type: 'image/png')
puts "Created event with id: #{event.id}"


puts ""
puts 'Creating seed responses and contacts for this event...'

kamiel = Contact.create(name: 'Kamiel', email: 'edeloscar@gmail.com')
response = Response.create(attendance: 1,
                           message: "I'll 🐝 there",
                           event_id: event.id,
                           contact_id: kamiel.id)
puts "Created #{response.attendance} response with id: #{response.contact.name}, with id:: #{response.id}"

stijn = Contact.create(name: 'Stijn', email: 'stijn@meetsymail.com')
response = Response.create(attendance: 1,
                           message: "Party on!!",
                           event_id: event.id,
                           contact_id: stijn.id)
puts "Created #{response.attendance} response with id: #{response.contact.name}, for contact: #{response.id}"

jochem = Contact.create(name: 'Jochem', email: 'jochem@meetsymail.com')
response = Response.create(attendance: 2,
                           message: "Cool! I'll let you know.",
                           event_id: event.id,
                           contact_id: jochem.id)
puts "Created #{response.attendance} response with id: #{response.contact.name}, for contact: #{response.id}"


luc = Contact.create(name: 'Luc', email: 'luc@meetsymail.com')
response = Response.create(attendance: 0,
                           message: "Damn, can't make it!",
                           event_id: event.id,
                           contact_id: luc.id)
puts "Created #{response.attendance} response with id: #{response.contact.name}, for contact: #{response.id}"


puts ""
puts "Creating seed updates for this event..."

update = Update.create(text: "I bought some discolights and a dj-panel! 🕺 Shall I bring them or do you have your own?",
                       contact_id: kamiel.id,
                       event_id: event.id)
puts "Created update from #{update.contact.name}: #{update.id}"

update = Update.create(text: "@Everybody, FYI, time and place has been changed.",
                       contact_id: organiser.id,
                       event_id: event.id)
puts "Created update from #{update.contact.name}: #{update.id}"


puts ""
puts "Creating seed snapbox photo's"

pizza_img = URI.open('https://4.bp.blogspot.com/-SMftXEPe5GA/VXsH7AClwGI/AAAAAAAAATI/GgNToUi4Hzw/s1600/IMG_8148.JPG')
photo = Photo.create(contact_id: organiser.id, event_id: event.id)
photo.image.attach(io: pizza_img, filename: 'pizza.png', content_type: 'image/png')
puts "Created photo from #{photo.contact.name}: #{photo.id}"

drinks_img = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/05/59/1c/fd/viking-pub-crawl-dublin.jpg')
photo = Photo.create(contact_id: kamiel.id, event_id: event.id)
photo.image.attach(io: drinks_img, filename: 'drinks.png', content_type: 'image/png')
puts "Created photo from #{photo.contact.name}: #{photo.id}"

party_img = URI.open('https://i.pinimg.com/originals/40/86/a5/4086a586a88512093127d30738338480.jpg')
photo = Photo.create(contact_id: luc.id, event_id: event.id)
photo.image.attach(io: party_img, filename: 'party.png', content_type: 'image/png')
puts "Created photo from #{photo.contact.name}: #{photo.id}"

guys_img = URI.open('https://bloximages.chicago2.vip.townnews.com/thesunchronicle.com/content/tncms/assets/v3/editorial/9/f2/9f2ac069-fa99-53d7-bca7-5fe11df03f20/4fbd0d141e512.image.jpg?resize=400%2C225')
photo = Photo.create(contact_id: kamiel.id, event_id: event.id)
photo.image.attach(io: guys_img, filename: 'guys.png', content_type: 'image/png')
puts "Created photo from #{photo.contact.name}: #{photo.id}"

puts ""
puts 'Finished seeds!'
