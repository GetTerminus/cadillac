class SetupController < ApplicationController
  layout "blank"
  before_action :authenticate_user!
  
  def show
    
  end
  
  def complete
    account = current_user.account
    account.load_recurrence_templates
    account.initialized = true
    account.save
    redirect_to root_path
  end
end
