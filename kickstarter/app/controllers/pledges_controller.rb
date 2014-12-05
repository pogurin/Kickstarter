class PledgesController < ApplicationController
	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new(pledge_params)
		@pledge.backer = current_user
		@pledge.project_id = params[:pledge][:project_id]
		@pledge.project.funded = @pledge.project.pledges.pluck(:amount).sum

		if @pledge.save
			redirect_to project_path(@pledge.project), notice:"Pledge made you sweetiepie!"
		else
			render 'new'
		end
	end

	def show
		@pledge = Pledge.find(params[:id])
	end 
	
	private
	def pledge_params
	    params.require(:pledge).permit(:amount)
	end

end
