class TweetsController < ApplicationController
	before_action :authenticate_user!

	def index
		@tweets = Tweet.where(user_id: current_user.id).all
	end

	def new
		@tweet = current_user.tweets.build
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def create
		@tweet = current_user.tweets.build(tweet_params)
		
		if @tweet.save
			redirect_to @tweet
		else
			render 'new'
		end
	end

	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			redirect_to @tweet
		else
			render 'edit'
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to tweets_path
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	private
		def tweet_params
			params.require(:tweet).permit(:text, :user_id, :count)
		end
end
