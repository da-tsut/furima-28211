class ItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_item, only: [:edit, :show]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid? 
       @item.save
       redirect_to root_path
    else
       render :new
    end
  end


 # def destroy
 #   item = Item.find(params[:id])
 #   item.destroy
 # end

 # def update
 #   item = Item.find(params[:id])
 #   item.update(item_params)
 # end

 # def show
 # end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end