class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def edit
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def item_detail
    @users = User.find(params[:id])
    @items = Item.find(params[:id])
    @images = Image.find(params[:id])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/mypage/#{current_user.id}"
    else
      root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :info,
      :category,
      :status, 
      :delivery_chage, 
      :delivery_area, 
      :delivery_date, 
      :user, 
      :price, 
      images_attributes: [:image]
      ).merge(user_id: current_user.id)
  end
end
