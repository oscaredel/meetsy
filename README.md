This is an app to plan events instantly, privately.
For an event you can request RSVPs and give updates. After the event you can add pictures which everybody can download. After a certain period, everything is deleted.

This app makes use of the following services:
Domain:     Namecheap
App:        Heroku
Storage:    Cloudinary
E-mail:     Sendgrid
Payments:   Stripe
Analytics:  Simple Analytics


# Setup Heroku dyno commands

heroku create meetsy
git push heroku master (not necessary, heroku dyno is synced with the master branch) 

heroku config:set {.ENV VARIABLES}
heroku run rails db:create db:migrate db:seed

heroku open
heroku logs --tail


Database design: https://kitt.lewagon.com/db/15416
