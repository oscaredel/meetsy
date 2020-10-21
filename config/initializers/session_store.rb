# Set session expiry, so it is saved even if safari or the homescreen app is closed

Rails.application.config.session_store :cookie_store,
    :key => '_meetsy_session',
    :expire_after => 30.days

# DOES NOT SEEM TO WORK PROPERLY
