class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]
  before_action :set_video
 

  
  def new
    @info = Info.new
  end

  
  def edit
  end

  
    def create
    @info = Info.new(info_params)
    @info.user_id = current_user.id
    @info.video_id = @video.id

    if @info.save
      redirect_to @video
    else
      render 'new'
    end
  end

  
  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to @info, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
      redirect_to root_path
    end
  end

  private
   
    def set_info
      @info = Info.find(params[:id])
    end

    def set_video
      @video = Video.find(params[:video_id])      
    end
   
    def info_params
      params.require(:info).permit(:comment)
    end
end
