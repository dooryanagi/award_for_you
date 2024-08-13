# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # 退会したユーザーが再びログインできないように制限
  before_action :user_status, only: [:create]

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

  # ログイン後、ログアウト後の行き先を指定
  def after_sign_in_path_for(resource)
    flash[:notice] = "おかえりなさい、#{current_user.name}さん！今日もお疲れ様です。"
	  my_page_path
  end

  def after_sign_out_path_for(resource)
	  new_user_session_path
  end

  # ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました"
  end

  private

    # 会員のログインに関わる情報を確認する
    def user_status
      # ログインフォームに入力されたemail情報をもとにuserを見つけ、その情報を変数に格納する
	    user = User.find_by(email: params[:user][:email])
      return if user.nil?
      return unless user.valid_password?(params[:user][:password])
      if user.is_active == true
    		create
      else
        flash[:alert] = "退会済みのアドレスです。新しいアドレスでの登録をお願いします。"
    		redirect_to new_user_registration_path
      end
    end

end
