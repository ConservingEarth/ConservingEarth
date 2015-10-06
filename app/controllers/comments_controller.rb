class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		@video = Video.find(params[:video_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.post_id = @post_id
		@comment.video_id = @video_id

		if @comment.save
			redirect_to post_path(@post)
			redirect_to video_path(@video)
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comment.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
end
