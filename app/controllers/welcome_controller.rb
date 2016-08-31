class WelcomeController < ApplicationController
  def index
  	@tweets = Tweet.all
  	@users = User.all
  	@user = current_user
  end
end
