class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit , :update]

  def index
    @items = Item.includes(:user).order("created_at DESC") 
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path(@item.id)
    end
  end
  

  def show
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
  #  item.destroy
  # end
  
  
  def edit
  end

  def update
        if @item.update(item_params)
           redirect_to item_path(@item)
        else
           render :edit
        end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id 
      redirect_to action: :index
    end
  end
end