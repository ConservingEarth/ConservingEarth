class GroupsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def search
		@group = Group.search(params[:search])
		if params[:search].present?
			@groups = Group.near(params[search], 50, :order => :distance)
		else
			@groups = Groups.all
		end
	end

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)

		if @group.save
			redirect_to @group, notice: "Successfully added a group"
		else
			render 'new'
		end
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		if @group.update(group_params)
			redirect_to @group, notice: "group updated"
		else
			render 'edit'
		end
	end

	def show
		@group = Group.find(params[:id])
	end

	def map
		@groups = Group.all
		@hash = Gmaps4rails.build_markers(@groups) do |group, marker|
 		marker.lat group.latitude
  		marker.lng group.longitude
  		
		end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to groups_path
	end

	private

		def find_post
			@group = Group.find(params[:id])
		end

		def set_post
      		@group = Group.find(params[:id])
    	end

		def group_params
			params.require(:group).permit(:title, :description, :image, :link, :longitude, :latitude, :address)
		end

end
