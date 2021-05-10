# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      question_id: params[:question_id]
    )
    @favorite.save
    redirect_to("/questions/#{params[:question_id]}")
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      question_id: params[:question_id]
    )
    @favorite.destroy
    redirect_to("/questions/#{params[:question_id]}")
  end
end
