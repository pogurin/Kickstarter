class PasswordResetsController < ApplicationController
  def create
  	@user = User.find_by_email(params[:email])

  	@user.deliver_reset_password_instructions! if @user
  	redirect_to(root_path, :notice => "Please check your email for further instructions.")
  end

  # Reset password form
  def edit
  	@token = params[:id]
  	@user = User.load_from_reset_password_token(params[:id])

  	if @user.blank?
  		not_authenticated
  		return
  	end
  end

  # Fires when the user has sent the reset password form (clicked on the link)
  def update
  	@token = params[:id]
  	@user = User.load_from_reset_password_token(params[:id])

		if @user.blank?
  		not_authenticated
  		return
  	end

  	@user.password_confirmation = params[:user][:password_confirmation]
  	if @user.change_password!(params[:user][:password])
  		redirect_to(root_path, :notice => "Password has been changed!")
  	else
  		render :action => "edit"
  	end  	
  end
end
