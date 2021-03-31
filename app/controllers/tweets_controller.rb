class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:author).ordered_by_most_recent
    @users = User.all.ordered_by_most_recent
    @tweet = Tweet.new
    @follow_suggestions = current_user.not_following.ordered_by_most_recent
  end

  def new
    @tweet = current_user.tweets.build
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      flash[:notice] = 'New tweet created'
      redirect_to tweets_path
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:author_id, :text)
  end
end
