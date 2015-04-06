# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.9.0-Q16'
