# Be sure to restart your server when you modify this file.

#Dresden::Application.config.session_store :cookie_store, key: '_dresden_session'

# USe ActiveRecord session store to avoid CookieOverflow error.
Dresden::Application.config.session_store :active_record_store