# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scraper_session',
  :secret      => '6a6f1fbcd8d7480fe080e70ebc68665a13794318219e915e679ae02691cadbae72d9da44d7d0c40d962f4e962a9f95832da7dc1d405ab4ca1168fe70d62ec9ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
