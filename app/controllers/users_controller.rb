class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]
  def index
    @users = User.all.ordered_by_most_recent
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
    params.require(:user).permit(:username, :fullname, :photo, :cover_image, :profile_pic, :cover_pic)
  end
end
