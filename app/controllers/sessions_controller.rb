class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:userid] = @user.id
      redirect_to apikey_path
    else
      render :action => "new"
    end
  end
end
