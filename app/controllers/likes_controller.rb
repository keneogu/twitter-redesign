class LikesController < ApplicationController
	def create
		@like = current_user.likes.new(tweet_id: params[:tweet_id])
	
		if @like.save
		  redirect_to tweets_path
		else
		  redirect_to tweets_path
		end
	  end
	
	  def destroy
		like = Like.find_by(id: params[:id], user: current_user, tweet_id: params[:tweet_id])
		if like
		  like.destroy
		  redirect_to tweets_path
		else
		  redirect_to tweets_path
		end
	  end
end
