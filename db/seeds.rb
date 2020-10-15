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
# attaching avatar image to the organiser
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

attendees = [
  {name: 'Kamiel', email: 'kamiel@meetsymail.com', attendance: 1, message: "I'll 🐝 there",},
  {name: 'Stijn', email: 'stijn@meetsymail.com', attendance: 1, message: "Party on!!"},
  {name: 'Jochem', email: 'jochem@meetsymail.com', attendance: 2, message: "Cool! I'll let you know."},
  {name: 'Luc', email: 'luc@meetsymail.com', attendance: 0, message: "Damn, can't make it!"}]

attendees.each do |attendee|
  contact = Contact.create(name: attendee[:name], email: attendee[:email])
  attendee[:name]
  response = Response.create(attendance: attendee[:attendance],
                             message: attendee[:message],
                             contact_id: contact[:id],
                             event_id: event[:id])

  puts "Created #{response.attendance} response for #{response.contact.name}, with id: #{response.id}"
end


puts ""
puts "Creating seed updates for this event..."

updates = [{contact_id: Contact.find_by(name: "Kamiel").id, text: "I bought some discolights and a dj-panel! 🕺 Shall I bring them or do you have your own?"},
           {contact_id: organiser.id, text: "@Everybody, FYI, time and place has been changed."}]

updates.each do |update|
  update = Update.create(text: update[:text],
                contact_id: update[:contact_id],
                event_id: event.id)

  puts "Created update from #{update.contact.name}: #{update.id}"
end


puts ""
puts "Creating seed snapbox photo's"

photo_data = [{filename: "pizza.jpg", contact_id: organiser.id, url: "https://4.bp.blogspot.com/-SMftXEPe5GA/VXsH7AClwGI/AAAAAAAAATI/GgNToUi4Hzw/s1600/IMG_8148.JPG"},
              {filename: "drinks.jpg", contact_id: Contact.find_by(name: "Kamiel").id, url: "https://media-cdn.tripadvisor.com/media/photo-s/05/59/1c/fd/viking-pub-crawl-dublin.jpg"},
              {filename: "party.jpg", contact_id: Contact.find_by(name: "Luc").id, url: "https://i.pinimg.com/originals/40/86/a5/4086a586a88512093127d30738338480.jpg"},
              {filename: "guys.jpg", contact_id: Contact.find_by(name: "Kamiel").id, url: "https://bloximages.chicago2.vip.townnews.com/thesunchronicle.com/content/tncms/assets/v3/editorial/9/f2/9f2ac069-fa99-53d7-bca7-5fe11df03f20/4fbd0d141e512.image.jpg?resize=400%2C225"}]

photo_data.each do |data|
  img = URI.open(data[:url])
  photo = Photo.create(contact_id: data[:contact_id], event_id: event.id)
  photo.image.attach(io: img, filename: data[:filename], content_type: 'image/png')
  puts "Created photo from #{photo.contact.name}: #{photo.id}"
end

puts ""
puts "Finished seeds! for"
puts "event.id: #{event.id}"
puts "organiser.id: #{organiser.id}"
