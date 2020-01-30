class PostController < ApplicationController
  def index
    @ladies_items = Item.where(category: 2).includes(:images).order("created_at DESC").limit(10)
    @mens_items = Item.where(category: 3).includes(:images).order("created_at DESC").limit(10)
    @electro_items = Item.where(category: 8).includes(:images).order("created_at DESC").limit(10)
    @hobby_items = Item.where(category: 7).includes(:images).order("created_at DESC").limit(10)
  end

  def search
    if 
      @items = Item.where('name LIKE(?)', "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end
end
