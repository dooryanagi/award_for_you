class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit, :withdraw]

  def show
    @user = current_user
    @grand_prizes = GrandPrize.where(owner_id: @user.id)
    @children = @user.children
  end

  def edit
    @user = current_user
    @child = Child.new
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
    flash[:notice] = "今までありがとうございました！閲覧のみは引き続き可能です。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_active, :email)
  end

  # ゲストユーザーはプロフィールの編集、退会ができない
  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to my_page_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
