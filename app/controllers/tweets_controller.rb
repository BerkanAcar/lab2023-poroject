class TweetsController < ApplicationController
	before_action :authenticate_user!

	def index
		@tweets = Tweet.where(user_id: current_user.id).all
	end

	def new
		@tweet = Tweet.new
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.name = current_user.name
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
