class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
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
