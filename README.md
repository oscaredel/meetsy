This is an app to plan events instantly, privately.
For an event you can request RSVPs and give updates. After the event you can add pictures which everybody can download.


# Setup Heroku production

heroku create meetsy
git push heroku master

heroku config:set CLOUDINARY_URL..........
heroku config:set MAILPROVIDER......
heroku run rails db:create db:migrate db:seed
heroku run rails

heroku open



Database design: https://kitt.lewagon.com/db/15416
