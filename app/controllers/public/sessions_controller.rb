# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end 
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  
  # Activeであるかを判断するメソッド
  def user_state
    # 入力されたemailからアカウントを1県取得
    user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if user.nil?
    # 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、この処理を終了する
    return unless user.valid_password?(params[:user][:password])
    # createアクションを実行させるためにcustomer_stateメソッドを終了する
    if user.is_active == true
      return
    else
      redirect_to new_user_registration_path
    end
  end 
  
end
