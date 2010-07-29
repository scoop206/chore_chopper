# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chore_chopper_session',
  :secret      => '6c8ea7b3c22bb20f21bdb27fc4d1d316438e70fe0efab0cd558bddc542566822a7fdeb2b28da50cae68eb2a790b864ccae6f16386f0125d0855798b2c11a85a9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
