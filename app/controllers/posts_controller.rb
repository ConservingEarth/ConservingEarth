class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :require_user, :only => [:edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]
	def search 
     	if params[:search].present? 
      		@post = Post.search(params[:search]) 
     	else 
     		@post = Post.all.order("created_at DESC") 
     	end 
   	end 


	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 30)
	end

	def show
		 @infos = Info.where(post_id: @post)
		 @comments = Comment.where(post_id: @post)
		 @random_post = Post.where.not(id: @post).order("RANDOM()").first
	end

	def new
		@post = current_user.posts.build
		

	end

	def create
		@post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to @post, notice: "Successfully uploaded your post"
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "post positive"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	private

		def require_user
		    unless current_user.id == @post.user_id
		    	redirect_to(request.referrer || root_path)
		    end
	  	end

		def post_params
			params.require(:post).permit(:title, :description, :image, :link, :slug)
		end

		def find_post
			@post = Post.friendly.find(params[:id])
		end

		def set_post
      		@post = Post.find(params[:id])
    	end

end
