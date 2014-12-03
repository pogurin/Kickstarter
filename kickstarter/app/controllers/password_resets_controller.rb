class PasswordResetsController < ApplicationController
  def create
  	@user = User.find_by_email(params[:email])
  	
  end

  def edit
  end

  def update
  end
end
