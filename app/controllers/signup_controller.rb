class SignupController < ApplicationController

  def step1
  end


  def step2
    @user = User.new
  end

  def step3
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

  def step6 #address
    session[:address_first_name] = user_params[:address_attributes][:first_name]
    session[:address_last_name] = user_params[:address_attributes][:last_name]
    session[:address_first_name_kana] = user_params[:address_attributes][:first_name_kana]
    session[:address_last_name_kana] = user_params[:address_attributes][:last_name_kana]
    session[:post_number] = user_params[:address_attributes][:post_number]
    session[:prefecture] = user_params[:address_attributes][:prefecture]
    session[:city] = user_params[:address_attributes][:city]
    session[:address_number] = user_params[:address_attributes][:address_number]
    session[:building] = user_params[:address_attributes][:building]
    session[:address_phone_number] = user_params[:address_attributes][:phone_number]

    @user = User.new
    @user.build_card
  end

  def create
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
       @address = @user.build_address(
        first_name: session[:address_first_name],
        last_name: session[:address_last_name],
        first_name_kana: session[:address_first_name_kana],
        last_name_kana: session[:address_last_name_kana],
        phone_number: session[:address_phone_number],
        post_number: session[:post_number],
        prefecture: session[:prefecture],
        city: session[:city],
        address_number: session[:address_number],
        building: session[:building],
      )      
      @address.save
      @card = @user.build_card(
        card_number: params[:user][:card_attributes][:card_number],
        limit_month: params[:user][:card_attributes][:limit_month],
        limit_year: params[:user][:card_attributes][:limit_year],
        security_code: params[:user][:card_attributes][:security_code],
      )
      @card.save
        # ログインするための情報を保管
        session[:id] = @user.id
        redirect_to '/signup/done'
    else
      render '/signup/step1'
    end
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
      :prefecture,
      :city,
      :address_number,
      :building,
      :phone_number
      ],
      card_attributes:[
      :id,
      :card_number,
      :limit_month,
      :limit_year,
      :security_code
      ]
    )
  end


end