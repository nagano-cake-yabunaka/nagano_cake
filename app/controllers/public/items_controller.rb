class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    unless params[:item_name].nil?
      Item.find(params[:item_name])
      redirect_to item_path(params[:id])
    else
      redirect_to items_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
