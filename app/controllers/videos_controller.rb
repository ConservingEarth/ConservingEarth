class VideosController < ApplicationController
	before_action :find_video, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, execpt: [:index, :show]
	
	def search 
     	if params[:search].present? 
      		@video = Video.search(params[:search]) 
     	else 
     		@video = Video.all.order("created_at DESC") 
     	end 
   	end 


	def index
		@videos = Video.all.order("created_at DESC").paginate(page: params[:page], per_page: 20)
	end

	def show
		 @infos = Info.where(video_id: @video)
		 @comments = Comment.where(video_id: @video)
	end

	def new
		@video = current_user.videos.build
	end

	def create
		@video = current_user.videos.build(video_params)

		if @video.save
			redirect_to @video, notice: "Successfully uploaded your video"
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @video.update(video_params)
			redirect_to @video, notice: "video positive"
		else
			render 'edit'
		end
	end

	def destroy
		@video.destroy
		redirect_to root_path
	end

	private

		def video_params
			params.require(:video).permit(:title, :description, :image, :link)
		end

		def find_video
			@video = Video.find(params[:id])
		end

		def set_video
      		@Video = Video.find(params[:id])
    	end

end
