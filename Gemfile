source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'


# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'


gem 'autoprefixer-rails'

gem 'haml'
gem 'simple_form'
gem 'devise'
gem 'paperclip'
gem 'masonry-rails'
gem 'will_paginate'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'execjs'



# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',  group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development



  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'aws-sdk'

group :development, :test do 

	gem 'pg'
	
end

group :production do
	gem 'therubyracer', :platform => :ruby
	gem 'libv8', '~> 3.16.14.7'
	gem 'pg'
	gem 'puma'
	gem 'rmagick'
end