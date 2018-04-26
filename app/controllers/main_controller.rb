class MainController < ApplicationController
  def index
  render layout: "index"
  end

  def single
    @user = User.find(params[:id])

  end

  def edit
    @idea = Idea.find(params[:id])
    @all = @idea.users_liked
  end

  def dashboard
    @user = User.find(session[:user_id])
    @all = Idea.all
    @mylikes = @user.ideas_liked_ids
  end

  def new
  end

  def addidea
   Idea.create(content:params[:idea], user:User.find(session[:user_id]))
    redirect_to '/main/dashboard'
  end

  def likedby
    Like.create(user:User.find(session[:user_id]), idea:Idea.find(params[:id]))
    redirect_to '/main/dashboard/'
  end

  def delidea
    gone = Idea.find(params[:id])
    gone.destroy
    redirect_to '/main/dashboard'
  end

end
