class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    # unless params[:item_name].nil?
    #   Item.where(params[:item_name])
    #   redirect_to items_path(params[:item_name])
    # end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
