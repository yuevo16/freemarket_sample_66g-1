class MypageController < ApplicationController
  def mypage
  end

  def user_profile
  end

  def 

  def identification
  end

  def credit_card
  end

  def item_detail
    @users = User.all
    @items = Item.all
    @images = Image.all 
  end
  

end
