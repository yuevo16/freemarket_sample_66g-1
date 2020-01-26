class MypageController < ApplicationController



  def show
  end


  def index
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def user_profile
  end

  def sell_list
    user = User.find(params[:id])
    @item = user.items
  end

  def identification
  end

  def credit_card
  end


  #出品詳細画面のコントローラー
  def item_detail
    @item = Item.find(params[:id])
    @user = current_user.nickname
    @image = @item.images[0].image
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
      # images_attributes: [:image]
      ).merge(user_id: current_user.id,saler: current_user.id)
  end


end

