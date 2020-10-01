require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




puts 'Creating seed event...'
event = Event.create(name: "Birthday party",
                     date_time: DateTime.new(2020,9,1,17),
                     location: "At my place",
                     description: "Let's celebrate my 30th year with a banger!!",
                     organiser_name: "Oscar Edel",
                     organiser_email: "edeloscar@gmail.com",)

balloons_img = URI.open('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
event.image.attach(io: balloons_img, filename: 'balloons.png', content_type: 'image/png')

# Add Response seeds

# Event.new(name: "Chess tournament").save!

puts 'Finished!'
