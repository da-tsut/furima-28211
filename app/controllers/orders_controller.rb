class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index,:create]

  def index
    if @item.order.present? || @item.user_id == current_user.id
      return redirect_to root_path
    end
       @user_order = UserOrder.new
  end


 def create
  @user_order = UserOrder.new(order_params)
  if @user_order.valid?
     pay_item
     @user_order.save
     redirect_to root_path
   else
     render action: :index
   end
  end

  private
  def order_params
    params.require(:user_order).permit(:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
