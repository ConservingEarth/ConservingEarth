class UserController < ApplicationController
before_filter :require_user, :only => [:edit, :update, :destroy]
	def index

	end

	def user
		@users = User.all
		@videos = Video.all
	end

	def show
		@user = User.find(params[:id])
		@friend = User.find_by_id(params[:name])
		

	end

	def create
	  @user = User.new(user_params)

	  respond_to do |format|
	    if @user.save

	      # Sends email to user when user is created.
	      ExampleMailer.registration_confirmation(@user).deliver

	      format.html { redirect_to @user, notice: 'User was successfully created.' }
	      format.json { render :show, status: :created, location: @user }
	    else
	      format.html { render :new }
	      format.json { render json: @user.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def update
			
		if @user.update(user_params)
			redirect_to @user, notice: "Update positive"
		else
			render 'edit'
		end
	end

	private
		def require_user
		    @user = User.find_by_id(params[:id])
		    redirect_to(request.referrer || root_path) unless current_user == @user
	  	end

	 	def user_params
			params.require(:user).permit(:avatar, :description, :friendships, :name)
		end
	  	
end
