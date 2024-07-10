class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
  end

  def withdraw
    @user = User.find_by(id: params[:user_id])
    @user.update(is_active: false)
    redirect_to admin_users_path
  end

end
