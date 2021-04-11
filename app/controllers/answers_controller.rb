class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update]

  def new
    @answer = Answer.new
  end
 
  def create
    @answer = Answer.new(answer_params_create)
    @answer.user_id = current_user.id
    @answer.question_id = params[:id]
    
    if @answer.save
      redirect_to(question_path)
    else
      render action: :new
    end
  end  

  def edit
    @question = @answer.question
  end

  def update 
    @answer.user_id = current_user.id
    @answer.question_id = @answer.question_id
    if @answer.update(answer_params_update)
      redirect_to(question_path(@answer.question_id))
    else
      render action: :edit
    end
  end


  private

  def set_answer
    @answer = Answer.find_by(id:params[:id])
  end

  def answer_params_create
    params.permit(:answer_content, :answer_image)
  end

  def answer_params_update
    params.require(:answer).permit(:answer_content, :answer_image)
  end

end
