class ProjectsController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at DESC").paginate(page: params[:page], per_page: 30)
	end

	def show
		@project= Project.find(params[:id])
	end
	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)

		if @project.save
			redirect_to @project, notice: "Successfully uploaded your project"
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
		
	end

	def update
		@project = Project.find(params[:id])	
		if @project.update(project_params)
			redirect_to @project, notice: "project updated"
		else
			render 'edit'
		end
		

		
	end

	def destroy
		@project.destroy
		redirect_to projects_path
		
	end



	private
	def project_params
			params.require(:project).permit(:name, :description, :image, :location, :published)
		end
end

