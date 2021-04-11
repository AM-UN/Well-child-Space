class AnswersController < ApplicationController
  before_action :authenticate_user!

  def show
  end
  
  def new
    @answer = Answer.new
  end
 
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:id]
    
    if @answer.save
      redirect_to(questions_path)
    else
      render action: :new
    end
  end  


  private

  def answer_params
    params.permit(:answer_content, :answer_image)
  end

end
