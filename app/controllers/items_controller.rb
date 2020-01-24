class ItemsController < ApplicationController


  def show
    @item = Item.find(params[:id])
    @user = current_user.nickname
    @image = @item.images[0].image
  end



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
    @item = Item.find(params[:id])
    @user = current_user.nickname
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/mypage/#{current_user.id}"
    else
      root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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
      :price, 
      images_attributes: [:image]
      ).merge(user_id: current_user.id,saler: current_user.id)
  end
end
