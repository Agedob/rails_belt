class ApplicationController < ActionController::Base
  before_action :check, except: :index
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
  protect_from_forgery with: :exception
end

private 

  def check 
    if session[:user_id] == nil
      flash[:errors] = ['sign in']
      redirect_to '/'
    end
  end
