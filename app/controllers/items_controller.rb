class ItemsController < ApplicationController

  before_action :authenticate_user!
  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end