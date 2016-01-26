class MessagesController < ApplicationController
require "net/http"

	def index
		@messages = Message.all		
	end

	def create
		@message = Message.create!(params[:message])
		
	end
end
