class RewardsController < ApplicationController


def new
		@reward = Reward.new
	end

	def create
		@reward = Reward.new(reward_params)
		@reward.project_id = current_project.id

		if @reward.save
			redirect_to project_url, notice:"reward made you sweetiepie!"
		else
			render 'new'
		end
	end

	def show
		@reward = Reward.find(params[:id])
	end 

	
private
	def reward_params
	    params.require(:reward).permit(:amount)
	end

end
