class GroupsController < ApplicationController
	before_action :authenticate_user!

	def search
		
	end

	def join
	    @group = Group.friendly.find(params[:id])
	    @m = @group.members.build(:user_id => current_user.id)
	    respond_to do |format|
	      if @m.save
	        format.html { redirect_to(@group, :notice => 'You have joined this group.') }
	        format.xml  { head :ok }
	      else
	        format.html { redirect_to(@group, :notice => 'Join error.') }
	        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
	      end
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
		@group = Group.friendly.find(params[:id])
	end

	def update
		@group = Group.friendly.find(params[:id])
		if @group.update(group_params)
			redirect_to @group, notice: "group updated"
		else
			render 'edit'
		end
	end

	def show
		@group = Group.friendly.find(params[:id])
	end

	def members
		@group = Group.friendly.find(params[:id])
	end

	def map
		@groups = Group.all
		@hash = Gmaps4rails.build_markers(@groups) do |group, marker|
 		marker.lat group.latitude
  		marker.lng group.longitude
  		marker.infowindow "#{group.id}"
  		
  		end


  		@location = params[:search], 100
		@group = Group.near(@location)

		if @location.empty?
			gflash notice: "need search term"
			redirect_to "/"
		else
			@groups
		end

	end

	def destroy
		@group = Group.friendly.find(params[:id])
		@group.destroy
		redirect_to groups_path
	end

	private

		def find_post
			@group = Group.friendly.find(params[:id])
		end

		def set_post
      		@group = Group.find(params[:id])
    	end

		def group_params
			params.require(:group).permit(:title, :description, :image, :link, :longitude, :latitude, :address, :slug)
		end

end