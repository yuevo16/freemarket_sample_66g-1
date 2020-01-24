class CardController < ApplicationController

    require "payjp"
    before_action :set_card
  
    def new
      card = Card.where(user_id: current_user.id)
      redirect_to card_path if card.exists?
    end
  
    def pay #payjpとCardのデータベース作成を実施します。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if params['payjp-token'].blank?
        redirect_to new_card_path
      else
        # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
        customer = Payjp::Customer.create(
        card: params['payjp-token'],
        ) # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        
        if @card.save
          redirect_to card_path
        else
          redirect_to pay_card_index_path
        end
      end
    
    end
  
    def delete #PayjpとCardデータベースを削除します
      card = Card.where(user_id: current_user.id).first
      redirect_to new_card_path
    end
  
    def show #Cardのデータpayjpに送り情報を取り出します
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to new_card_path
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end
  
    private
  
    def set_card
      @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    end
    
  
end
