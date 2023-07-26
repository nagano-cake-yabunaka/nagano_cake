class Public::CartItemsController < ApplicationController
  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item.
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end
end
