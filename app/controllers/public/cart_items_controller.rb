class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end
end
