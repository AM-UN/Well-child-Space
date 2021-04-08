class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end
 
  def create
    @question = Question.new(question_params)
  
    if @question.save
      redirect_to(questions_path)
    else
      render(new_question_path)
    end
  end  

  def show
  end

  def edit
  end

  def update 
    if @question.update(question_params)
      redirect_to(questions_path)
    else
      render(edit_question_path)
    end
  end

  def destroy  
    if @question.destroy
      redirect_to(questions_path)
    end
  end

  private
    def set_question
      @question = Question.find_by(id:params[:id])
    end
   
    def question_params
      params.require(:question).permit(:question_content, :question_image)
    end
   
end