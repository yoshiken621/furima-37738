class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :access_controll, only: :edit
  before_action :choose_id, only: [:show, :edit, :update, :destroy]
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :item_category_id, :item_status_id, :delivery_fee_id,
                                 :delivery_day_id, :item_price, :prefecture_id).merge(user_id: current_user.id)
  end

  def access_controll
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def choose_id
    @item = Item.find(params[:id])
  end
end
