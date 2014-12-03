class PasswordResetsController < ApplicationController
  def create
  	@user = User.find_by_email(params[:email])

  	@user.deliver_reset_password_instructions! if @user
  	redirect_to(root_path, :notice => "Please check your email for further instructions.")
  end

  def edit
  end

  def update
  end
end
