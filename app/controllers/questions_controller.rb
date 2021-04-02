class QuestionsController < ApplicationController
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
      redirect_to("/questions")
    else
      render("questions/new")
    end
  end  

  def show
  end

  def edit
  end

  def update 
    if @question.update(question_params)
      redirect_to("/questions")
    else
      render("questions/edit")
    end
  end

  def destroy  
    if @question.destroy
      redirect_to("/questions")
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