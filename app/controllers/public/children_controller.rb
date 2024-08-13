class Public::ChildrenController < ApplicationController

  def create
    @child = current_user.children.new(child_params)
    if @child.save
      flash[:notice] = "家族情報を追加できました！"
      redirect_to my_page_path(current_user)
    else
      flash[:alert] = "家族情報を追加できませんでした。必須情報を確認してください"
      redirect_to edit_information_path(current_user)
    end
  end

  def show
    child = Child.find(params[:id])
    render json: child
  end

  private

  def child_params
    params.require(:child).permit(:name, :birthday)
  end


end
