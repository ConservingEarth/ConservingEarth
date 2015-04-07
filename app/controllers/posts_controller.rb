class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, execpt: [:index, :show]
	
	def search 
     	if params[:search].present? 
      		@post = Post.search(params[:search]) 
     	else 
     		@post = Post.all.order("created_at DESC") 
     	end 
   	end 


	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 20)
	end

	def show
		 @infos = Info.where(post_id: @post)
		 @comments = Comment.where(post_id: @post)
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

	private

		def post_params
			params.require(:post).permit(:title, :description, :image, :link)
		end

		def find_post
			@post = Post.find(params[:id])
		end

		def set_post
      		@post = Post.find(params[:id])
    	end

end
