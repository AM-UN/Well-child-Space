class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(user_path)
    else
      render action: :edit
    end
  end

  def ensure_correct_user
    if current_user
      if current_user.id != params[:id].to_i 
        flash[:notice] = "他のユーザーは編集できません"
        redirect_to(root_path)
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduciton)
  end
  
end
