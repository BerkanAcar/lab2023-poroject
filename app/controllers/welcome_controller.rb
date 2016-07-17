class WelcomeController < ApplicationController
  def index
  	@tweets = Tweet.all
  	@users = User.all
  end
end
