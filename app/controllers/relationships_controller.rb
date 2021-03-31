class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    flash.now[:notice] = 'testing testing'
    redirect_to tweets_path
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)

    redirect_to tweets_path
  end
end
