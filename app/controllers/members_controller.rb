class MembersController < ApplicationController

	before_filter :authenticate_user!
	  def create
	    @member = current_user.members.build(:group_id => params[:group_friendly_id])
	    if @member.save
	      flash[:notice] = "You have joined this group."
	      redirect_to :back
	    else
	      flash[:error] = "Unable to join."
	      redirect_to :back
	    end
	  end

	  def destroy
	    @members = current_user.members.find(params[:id])
	    @members.destroy
	    flash[:notice] = "Removed you as a member."
	        redirect_to :back
	  end

	def index
		@members = Member.all

	end

	def show
		@members = Member.all
	end

end

