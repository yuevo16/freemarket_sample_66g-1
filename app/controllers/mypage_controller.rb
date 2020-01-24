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

  def item_detail
    @item = Item.find(params[:id])
    @user = current_user.nickname
    # @images = Item.include(:images)
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end
  

end

