class Public::UsersController < ApplicationController

  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
    @grand_prizes = @user.grand_prizes
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to my_page_path(current_user)
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_user
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_active)
  end

  # ゲストユーザーはプロフィールを編集できない
  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to my_page_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
