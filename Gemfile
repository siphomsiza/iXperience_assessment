source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
#
gem 'active_type','~> 1.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'

gem 'bcrypt', '~> 3.1.7'
gem 'rake', '13.0.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
#gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use postgres as the database for Active Record
gem 'pg'
# Use Uglifier as compressor for JavaScript assets
# an asset gemification of the font-awesome icon font library (https://github.com/bokmann/font-awesome-rails)
gem "font-awesome-rails"
# bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications. (https://github.com/twbs/bootstrap-sass)
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'mailcatcher'

  # factory_girl_rails provides integration between factory_girl and rails 3 (http://github.com/thoughtbot/factory_girl_rails)
  gem 'factory_bot_rails'
  # Easily generate fake data (https://github.com/stympy/faker)
  gem 'faker'
  # RSpec for Rails (http://github.com/rspec/rspec-rails)
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails', branch: "4-0-maintenance"

  gem 'thin'
  gem 'pry'
  gem 'traceroute'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'rspec'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'test-unit'
  gem 'webmock'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
