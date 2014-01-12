class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  before_action :authorize
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
    
    def authorize
      flash[:notice] = 'Вам необходимо войти на сайт для доступа в данный раздел'
      redirect_to root_url unless current_user
    end
end
