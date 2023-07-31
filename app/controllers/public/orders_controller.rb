class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
