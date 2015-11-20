class MembersController < ApplicationController
	
	
	  def create
	
	    @member = current_user.members.build(:group_id => params[:group_id])
	    if @member.save
	      flash[:notice] = "You have joined this group."
	      redirect_to members_path
	    else
	      flash[:error] = "Unable to join."
	      redirect_to members_path
	    end
	  end

	  def destroy
	    @member = current_user.members.find(params[:id])
	    @member.destroy
	    flash[:notice] = "Removed you as a member."
	        redirect_to group_path
	  end

	def index
		 
 	 	 @group = Group.friendly.find(params[:id])
     	 @members = @group.users

	end

	def show
		
		@member = Group.friendly.find(params[:id])
	end

	private
	

	
end

