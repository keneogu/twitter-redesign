class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(tweet_id: params[:tweet_id])

    redirect_to tweets_path if @like.save
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, tweet_id: params[:tweet_id])
    like.destroy
    redirect_to tweets_path
  end
end
