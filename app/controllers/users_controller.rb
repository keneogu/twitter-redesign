class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Sign Up Successfully'
      redirect_to tweets_path
    else
      flash[:notice] = 'Username already exists OR Username is blank'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
