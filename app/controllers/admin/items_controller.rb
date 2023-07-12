class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @items = Item.all
    @item.genre_id = Genre.find(params[:genre_id])
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
    end
end
