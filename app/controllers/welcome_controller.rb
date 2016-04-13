class WelcomeController < ApplicationController

require 'json'
require 'oembed'

	def youtube
		
		@video = OEmbed::Providers::Youtube.get("https://youtu.be/HkZDSqyE1do")

	end

	def create

	end

	def edit
	end

	def delete
	end

	def user
		@users = User.all
		
	
	end
	
end
