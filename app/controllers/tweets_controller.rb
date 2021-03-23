class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at DESC")
    @users = User.all
    @tweet = Tweet.new
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
