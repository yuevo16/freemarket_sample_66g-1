class MypageController < ApplicationController



  def show
  end

  def user_profile
  end

  def sell_list
    user = User.find(params[:id])
    @item = user.items
    @user_items = @item.where(buyer: nil).includes(:images).order("created_at DESC")
  end

  def deal
    user = User.find(params[:id])
    @item = user.items
    @user_items = @item.where.not(buyer: nil).includes(:images).order("created_at DESC")
  end

  def sold
    user = User.find(params[:id])
    @item = user.items
    @user_items = @item.where(saler: nil,buyer: nil).includes(:images).order("created_at DESC")
  end

  def identification
  end

  def credit_card
  end


  #出品詳細画面のコントローラー
  def item_detail
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @image = @item.images[0].image
    @category = Category.find(@item.category)
    @delivery_chage = Delivery_chage.find(@item.delivery_chage)
    @status = Status.find(@item.status)
    @prefecture = Prefecture.find(@item.delivery_area)
    @delivery_date = Delivery_date.find(@item.delivery_date)
  end

  #編集画面のコントローラー
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    
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
      :delivery_method,
      :price, 
      images_attributes: [:image, :_destroy, :id]
      ).merge(user_id: current_user.id,saler: current_user.id)
  end


end

