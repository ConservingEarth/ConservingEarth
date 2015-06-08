class WelcomeController < ApplicationController

require 'json'
require 'oembed'

	def youtube
		
		@video = OEmbed::Providers::Youtube.get("https://www.youtube.com/watch?v=galL-HzdOC4")

	end

	def create

	end

	def edit
	end

	def delete
	end
end
