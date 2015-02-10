class ApikeysController < ApplicationController
  before_action :require_login
  
  def show
  
  end
  
  def remove
    current_user.update_attribute(:api_key, nil)
    redirect_to apikey_path
  end
  
  def admin_api_remove
    
  end
  
  def add
    current_user.update_attribute(:api_key, SecureRandom.hex)
    redirect_to apikey_path
  end
  
end
