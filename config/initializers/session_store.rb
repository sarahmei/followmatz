# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_follow_matz_session',
  :secret      => 'a8037fc8833405c41ee2569d09d8343d6130ec7531aea547b345388bc71f3a4cdcb863bc5a594d1a1882535e09a7493f4b66f2fb4d17e672b3921e86524e6e60'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
