class Public::ChildrenController < ApplicationController

  def create
    @child = current_user.children.new(child_params)
    if @child.save
      flash[:notice] = "家族情報を追加できました！"
      redirect_to my_page_path(current_user)
    else
      render controller: 'user', action: 'edit'
    end
  end

  def edit
  end

  def show
    child = Child.find(params[:id])
    render json: child
  end

  private

  def child_params
    params.require(:child).permit(:user_id, :name, :birthday, :prof_image)
  end


end
