class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new   
  end

  def create
    @project = Project.new(project_params)

    if @product.save
      redirect_to project_url
    else 
      render 'new'
    end
  end

  private 
  def project_params
    params.require(:project).permit(:title, :description, rewards_atributes: [:amount, :description])
   end
end
