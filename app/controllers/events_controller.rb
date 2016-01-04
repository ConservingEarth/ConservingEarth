class EventsController < ApplicationController
	before_filter :require_user, :only => [:edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]

	def index
		@events = Event.all.order("created_at DESC").paginate(page: params[:page], per_page: 30)
	end

	def show
		@event= Event.find(params[:id])
	end
	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to @event, notice: "Successfully uploaded your event"
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
			
		if @event.update(event_params)
			redirect_to @event, notice: "event positive"
		else
			render 'edit'
		end
		

		
	end

	def destroy
		@event.destroy
		redirect_to events_path
		
	end



	private
	def event_params
			params.require(:event).permit(:title, :description, :image, :location, :capacity, :starts_at, :ends_at, :published, :email_info, :announced)
		end
end
