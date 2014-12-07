class ProjectsController < ApplicationController
  # before_action require_login, except: :index

  def index
    @projects = if params[:search]
      Project.where(category_id: params[:search])
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new   
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    if @project.save
      redirect_to projects_url
    else 
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    # project funded amount should be in the project controller and not the pledge controller
    @project.funded = @project.pledges.pluck(:amount).sum
    
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])  
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])  
    @project.destroy
    redirect_to projects_path
  end

  private 
  def project_params
    params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, :category_id, rewards_attributes: [:name, :backer_limit, :amount, :_destroy, :description], pledges_attributes: [:amount, :id,])
  end
end
