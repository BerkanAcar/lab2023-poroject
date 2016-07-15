class MessagesController < ApplicationController
	before_action :authenticate_user!
	def index
		@messages = Message.where(user_id: current_user.id).all
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.id
		if @message.save
			redirect_to messages_path
		else
			render 'new'
		end
	end
	private
		def message_params
			params.require(:message).permit(:text, :user_id)
		end
end
