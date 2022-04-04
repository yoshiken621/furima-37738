class ItemsController < ApplicationController
 
  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_detail, :item_category_id, :item_status_id, :delivery_fee_id, :delivery_day_id, :item_price, :user, :prefecture_id).merge(user_id: current_user.id)
  end
end
