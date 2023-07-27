class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    elsif @cart_item.save
    　@cart_items = current_customer.cart_items.all
    　render 'index'
    else
      @cart_items = current_customer.cart_items.all
      render 'index'
    end
  end

  def update
    # cart_item = CartItem.find(cart_item.item.id)
    # cart_item.update
    # redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end
end
