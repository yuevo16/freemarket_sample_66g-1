class SignupController < ApplicationController
  require 'payjp'
  Payjp.api_key = Rails.application.secrets.payjp_private_key
 
  def step1
  end


  def step2
    @user = User.new
  end

  def step3 #ユーザー情報
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]    
    session[:user_first_name] = user_params[:first_name] 
    session[:user_last_name] = user_params[:last_name]
    session[:user_first_name_kana] = user_params[:first_name_kana]
    session[:user_last_name_kana] = user_params[:last_name_kana]

    @user = User.new
  end

  def step4
    session[:phone_number] = user_params[:phone_number]

    @user = User.new
  end

  def step5
    @user = User.new
    @user.build_address
  end

  #住所
  def step6
    session[:address_first_name] = user_params[:address_attributes][:first_name]
    session[:address_last_name] = user_params[:address_attributes][:last_name]
    session[:address_first_name_kana] = user_params[:address_attributes][:first_name_kana]
    session[:address_last_name_kana] = user_params[:address_attributes][:last_name_kana]
    session[:post_number] = user_params[:address_attributes][:post_number]
    session[:prefecture_id] = user_params[:address_attributes][:prefecture_id]
    session[:city] = user_params[:address_attributes][:city]
    session[:address_number] = user_params[:address_attributes][:address_number]
    session[:building] = user_params[:address_attributes][:building]
    session[:address_phone_number] = user_params[:address_attributes][:phone_number]

    @user = User.new
  end

  def pay #payjpとCardのデータベース作成を実施します。
    binding.pry
    if params['payjp-token'].blank?
      redirect_to step6_signup_index_path
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      ) # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      @card = Card.new(customer_id: customer.id, card_id: customer.default_card)
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        birth_year: session[:birth_year],
        birth_month: session[:birth_month],
        birth_day: session[:birth_day],
        first_name: session[:user_first_name],
        last_name: session[:user_last_name],
        first_name_kana: session[:user_first_name_kana],
        last_name_kana: session[:user_last_name_kana],
        phone_number: session[:phone_number]
      )
      if @user.save
        @card.user_id = @user.id
        @card.save
        @address = @user.build_address(
          first_name: session[:address_first_name],
          last_name: session[:address_last_name],
          first_name_kana: session[:address_first_name_kana],
          last_name_kana: session[:address_last_name_kana],
          phone_number: session[:address_phone_number],
          post_number: session[:post_number],
          prefecture_id: session[:prefecture_id],
          city: session[:city],
          address_number: session[:address_number],
          building: session[:building],
        )
        @address.save

        session[:id] = @user.id
        redirect_to done_signup_index_path
      else
        redirect_to step6_signup_index_path
      end
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end


  private
  
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :encrypted_password,
      :birth_year,
      :birth_month,
      :birth_day,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :phone_number,

      address_attributes:[
      :id,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :post_number,
      :prefecture_id,
      :city,
      :address_number,
      :building,
      :phone_number
      ],
    )
  end
end