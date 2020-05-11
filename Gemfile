# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Rack for webserver interface
gem 'rack'
# Rails
gem 'rails'
# Rails - app server
gem 'puma'
# Rails - input sanitation
gem 'auto_strip_attributes'
# Rails - file upload validation
gem 'activestorage-validator'
# Rails - pagination
gem 'will_paginate'
# Rails - readable URLS
gem 'friendly_id'
# Rails - user authentication
gem 'devise', github: 'plataformatec/devise'
# Rails - activerecord database
gem 'mysql2'
# Rails - spreadsheet parsing
gem 'spreadsheet'
# Rails - generate ActiveStorage variants
gem 'mini_magick'
# Rails - custom association ordering
gem 'order_as_specified'
# HTML - shorthand
gem 'haml-rails'
# CSS - shorthand
gem 'sassc-rails'
# CSS - framework
gem 'bootstrap'
gem 'bootstrap-datepicker-rails'
# JS - shorthand
gem 'coffee-rails'
# JS - compressor
gem 'uglifier'
# JS - package manager
gem 'webpacker'
# JS - jquery framework
gem 'jquery-rails', '4.3.5'
# JS - jquery framework UI
gem 'jquery-ui-rails'
# JS - turbolinks (simulated page loads from cache)
gem 'turbolinks'
# JS - text editor for text areas
gem 'tinymce-rails'
# JS - nested form helper
gem 'nested_form_fields'
# JS - chart generation
gem 'chartkick'
# JS - service worker
gem 'serviceworker-rails'
# JS - v8 engine
gem 'mini_racer', platforms: :ruby
# JSON - library
gem 'json'
# JSON - API construbtor
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Internationalization
gem 'rails-i18n'
gem 'devise-i18n'
gem 'i18n-tasks'

group :production, :staging do
  # Web server
  gem 'passenger'
  # DDoS and other webserver protections
  gem 'rack-attack'
  # newrelic monitoring
  gem 'newrelic_rpm'
  # Cronjobs for emails
  # gem 'whenever', require: false
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'coverband', require: false
  gem 'database_consistency', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubycritic', require: false
  gem 'traceroute', require: false
  # More readable output
  gem 'awesome_print'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Rails - documentation generation
  gem 'yard', require: false
  gem 'yard-activerecord', require: false
  # Rails - Generates an ERD based on the app's models
  gem 'rails-erd'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
