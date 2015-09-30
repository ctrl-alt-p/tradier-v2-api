source 'https://rubygems.org'

gem 'rails'
gem 'sprockets-rails'
gem 'arel'

# Use Unicorn as the app server
gem 'unicorn'

# Use ActiveModelSerializers to serialize JSON responses
gem 'active_model_serializers'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# JSONAPI::Resources, or "JR", provides a framework for developing a server that complies with the JSON API specification.
gem 'jsonapi-resources'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', github: 'rails/web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :production do
  gem 'mysql2'
end
