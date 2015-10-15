class UserController < ApplicationController
before_filter :require_user, :only => [:edit, :update, :destroy]
	def index
		
	end

	def user
		@users = User.all
	end

	def show
		
	end
	def edit
		
	end
	def dashboard
	end

	def activity
	end

	def favorties
	end

	def inbox
	end

	def groups
	end

	def profile
	end

	def friends
		
	end

	def settings
	end

	private
		def require_user
		    @user = User.find_by_id(params[:id])
		    redirect_to(request.referrer || root_path) unless current_user == @user
	  	end
end
