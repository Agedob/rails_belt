class SessionsController < ApplicationController
  def new
  end

  def create
    @error = User.create(form_param).errors.full_messages
      if @error.length > 0
        flash[:error] = @error
        redirect_to root_url
      else
        session[:user_id] = User.find_by_email(form_param[:email]).id
        redirect_to '/main/dashboard'
      end
    end

  def login
      # Log User In
        @error = ['invalid login', 'please try again']
      if !(User.find_by_email(params[:email]).try(:authenticate, params[:password])).nil?
        session[:user_id] = User.find_by(email: params[:email]).id
        puts session[:user_id]
        redirect_to '/main/dashboard'
      else
        flash[:errors] = @error
        redirect_to '/'
      end
        # if 
          # save user id to session
          # redirect to users profile page
      # if authenticate false
          # add an error message -> flash[:errors] = ["Invalid"]
          # redirect to login page
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
    def form_param
      params.require(:form).permit(:first_name,:last_name, :email, :password, :password_confirmation)
    end

end