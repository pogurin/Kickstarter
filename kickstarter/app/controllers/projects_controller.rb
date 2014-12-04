class ProjectsController < ApplicationController
  # before_action require_login, except: :index

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new   
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else 
      render 'new'
    end
  end

  private 
  def project_params
    params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, :owner_id, rewards_atributes: [:name, :amount, :_destroy, :description])
  end
end
