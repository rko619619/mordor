source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'bootstrap', '~> 4.5.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails','~> 4.4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'aws-sdk-s3', '~> 1.73'
gem 'popper_js', '>= 1.14.5'
gem 'carrierwave', '>= 2.0'
gem "mini_magick", '>= 4.10.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'rspec','>= 3.9.0'
gem 'annotate' , '>= 3.1.1'
gem 'pry'
gem 'aws-sdk', '>= 3.0.0'
gem 'paperclip', '>= 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
