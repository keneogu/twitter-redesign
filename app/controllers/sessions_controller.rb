class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      flash[:success] = 'Logged in successfully'
      redirect_to user_path(@user)
    else
      flash.now[:notice] = 'Please enter valid username'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged Out'
    redirect_to root_path
  end
end
