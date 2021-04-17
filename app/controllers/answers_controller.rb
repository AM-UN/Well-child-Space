class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    @answer = Answer.new
  end
 
  def create
    @answer = Answer.new(answer_params_create)
    @answer.user_id = current_user.id
    @answer.question_id = params[:id]
    
    if @answer.save
      flash[:notice] = "回答が追加されました"
      redirect_to question_path
    else
      redirect_to question_path, flash:{error:@answer.errors.full_messages}
    
    end
  end  

  def edit
    @question = @answer.question
  end

  def update 
    @answer.user_id = current_user.id
    @answer.question_id = @answer.question_id
    if @answer.update(answer_params_update)
      flash[:notice] = "回答が編集されました"
      redirect_to(question_path(@answer.question_id))
    else
      @question = @answer.question
      render action: :edit
    end
  end

  def destroy  
    if @answer.destroy
      redirect_to(question_path(@answer.question_id))
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
