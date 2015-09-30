class User
  include Redis::Objects
  include DataMapper::Resource

  #
  # Datamapper fields, just used for .create
  #
  property :id,             Serial  # Unique identifier for the user
  property :account_number, Integer # Account Number

  #
  # Use redis-objects fields for everything else
  #
  value :day_trader     # Designates if the account is a Pattern Day Trading Account
  value :option_level   # The Level of Options trading permission that is on the account
  value :account_type   # Account Type (cash or margin)
  value :name           # User's name
  value :status         # Status of the account (approved, closed)
  value :classification # Class of account (individual, ira, roth_ira, joint)

  value :disabled
  value :name
  list :cart, :marshal => true


end

# Absolutely need this line for dm-redis
User.finalize
