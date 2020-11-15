class MessagesController < ApplicationController

def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end