class InterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @interest = Interest.new(
      user_id: current_user.id,
      answer_id: params[:answer_id]
      ) 
    @interest.save
    answer = Answer.find_by(id:params[:answer_id])
    redirect_to("/questions/#{answer.question_id}")
  end

  def destroy
    @interest = Interest.find_by(
      user_id: current_user.id, 
      answer_id: params[:answer_id]
      )
    @interest.destroy
    answer = Answer.find_by(id:params[:answer_id])
    redirect_to("/questions/#{answer.question_id}")
  end 

end