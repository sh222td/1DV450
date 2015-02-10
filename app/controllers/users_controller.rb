class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.api_key = SecureRandom.hex
    
    if @user.save
      session[:userid] = @user.id
      redirect_to apikey_path
    else
      render :action => "new"
    end
  end
  
  # Loginmethod for Admin
  
  def admin_login
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password]) && u.params[:admin_auth]
      session[:userid] = u.id
      redirect_to apikey_path
    else
      flash[:danger] = "Felaktigt användarnamn/lösenord/adminkod!"
      redirect_to admin_user_path
    end
  end
  
  # Loginmethod
  
  def login
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:userid] = u.id
      redirect_to apikey_path
    else
      flash[:danger] = "Felaktigt användarnamn/lösenord!"
      redirect_to root_path
    end
  end
  
  # Logoutmethod
  
  def logout
    flash[:warning] = "Du är nu utloggad"
    session[:userid] = nil
    redirect_to root_path
  end
  
  private
  
  # Method for making sure all user settings are set.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def admin
    redirect_to admin_user_path  
  end
  
end
