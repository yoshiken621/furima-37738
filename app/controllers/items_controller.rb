class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
 
  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :item_category_id, :item_status_id, :delivery_fee_id, :delivery_day_id, :item_price, :prefecture_id).merge(user_id: current_user.id)
  end
end
