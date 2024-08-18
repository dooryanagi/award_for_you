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
    p "=============="
    p @user
    p @user.errors
  end

  def update
    @child = Child.new
    @user = current_user
    p @user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の編集が完了しました"
      redirect_to my_page_path(current_user)
    else
      flash.now[:alert] = "編集できませんでした。必須項目を確認してください。"
      render :edit
    end
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
