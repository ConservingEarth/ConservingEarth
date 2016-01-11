class VideosController < ApplicationController
	before_action :find_video, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :require_user, :only => [:edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]
	require 'json'
	require 'oembed'

	def search 
     	if params[:search].present? 
      		@video = Video.search(params[:search]) 
     	else 
     		@video = Video.all.order("created_at DESC") 
     	end 
   	end 


	def index

		@videos = Video.all.order("created_at DESC").paginate(page: params[:page], per_page: 50)
		expire_fragment('video_cache')
		
	end

	def show
		 @infos = Info.where(video_id: @video)
		 @comments = Comment.where(video_id: @video)
		 @random_video = Video.where.not(id: @Video).order("RANDOM()").first
		 @youtube = OEmbed::Providers::Youtube.get(@video.link)
		 
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
		redirect_to videos_path
		
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	private

		def require_user
		    unless current_user.id == @video.user_id
		    	redirect_to(request.referrer || root_path)
		    end
	  	end
		

		def video_params
			params.require(:video).permit(:title, :description, :image, :link,)
		end

		def find_video
			@video = Video.find(params[:id])
		end

		def set_video
      		@Video = Video.find(params[:id])
    	end

end

