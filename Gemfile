source :rubygems

gem 'rake'
gem 'sinatra', '~> 1.2.3'
gem 'shotgun', '~> 0.9'
gem 'haml', '~> 3.1.4'
gem 'rack-coffee'

# Sass & Compass
gem 'sass', '~> 3.1.12'
gem 'compass', '~> 0.11.6'

# Sass libraries
gem 'grid-coordinates', '~> 1.1.4'

gem 'activerecord'
gem 'sinatra-activerecord' # excellent gem that ports ActiveRecord for Sinatra

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg' # this gem is required to use postgres on Heroku
end
