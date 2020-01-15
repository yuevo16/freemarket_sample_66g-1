class SignupController < ApplicationController

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
      :pay_id,
      :phone_number,
    )
  end

  def step1
  end


  def step2
    @user = User.new 
    
  end

  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:encrypted_password] = user_params[:encrypted_password]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]    
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]

    @user = User.new
  end

  def step4
    session[:phone_number] = user_params[:phone_number]

    @user = User.new
  end

  def step5
    session[:pay_id] = user_params[:pay_id]
    
    @user = User.new
  end

  def step6
    

    @user = User.new
  end
end