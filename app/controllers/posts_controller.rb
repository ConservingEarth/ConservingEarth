class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index 
 		@posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
 	end 
 
 
 	def new 
 		@post = current_user.posts.build
 	end 
 
 
 	def show 
 		@post = Post.find(params[:id]) 
 		@comments = Comment.where(post_id: @post)
 	end 
 
 
 	def create 
 		@post = current_user.posts.build(post_params) 
 
 
 		if @post.save 
 			redirect_to @post 
 		else 
 			render 'new' 
 		end 
 	end 
 
 
 	def edit 
 		@post = Post.find(params[:id]) 
 	end 
 
 
 	def update 
 		@post = Post.find(params[:id]) 
 
 
 		if @post.update(params[:post].permit(:title, :body)) 
 			redirect_to @post 
 		else 
 			render 'edit' 
 		end 
 	end 
 
 
 	def destroy 
 		@post = Post.find(params[:id]) 
 		@post.destroy 
 
 
 		redirect_to root_path 
 	end 
 
 
 	private 
 
 
 	def post_params 
 		params.require(:post).permit(:title, :body, :link, :image) 
 	end 

 	def require_login
    	unless current_user
      		redirect_to login_url
    	end
	end	
 end 
