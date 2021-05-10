# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]
  before_action :ensure_correct_user, only: %i[edit update]
  before_action :set_user, only: %i[show edit update answers favorites interests]

  def show
    @questions = Question.where(user_id: @user.id).includes(answers: :user).order(updated_at: :desc)
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'プロフィールが編集されました'
      redirect_to(user_path)
    else
      render action: :edit
    end
  end

  def answers
    @answers = Answer.where(user_id: @user.id).includes(question: :user).order(updated_at: :desc)
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id).includes(question: [:user, answers: :user]).order(updated_at: :desc)
  end

  def interests
    @interests = Interest.where(user_id: @user.id).includes(answer: [:user, question: :user]).order(updated_at: :desc)
  end

  def ensure_correct_user
    if current_user
      if current_user.id != params[:id].to_i
        flash[:notice] = '他のユーザーは編集できません'
        redirect_to(root_path)
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduction)
  end
end
