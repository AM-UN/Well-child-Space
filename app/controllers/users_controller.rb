class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :user_answers, :user_favorites]

  def show
  end

  def edit
  end

  def update 
    if @user.update(user_params)
      redirect_to(user_path)
    else
      render action: :edit
    end
  end

  def user_answers 
    @answers = Answer.where(user_id: @user.id)
  end 

  def user_favorites 
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

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduciton)
  end
  
end
