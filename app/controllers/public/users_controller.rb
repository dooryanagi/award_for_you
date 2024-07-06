class Public::UsersController < ApplicationController
  def show
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

end
