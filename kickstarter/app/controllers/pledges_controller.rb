class PledgesController < ApplicationController
	def new
		@pledge = Pledges.new
	end

	def create
		@pledge = Pledges.new(pledge_params)
		if @pledge.save
			redirect_to project_url, notice:"Pledge made you sweetiepie!"
		else
			render 'new'
		end
	end

	def show
		@pledge = Pledges.find(params[:id])
	end 
	
private
	def pledge_params
	    params.require(:pledge).permit(:amount)
	end

end
