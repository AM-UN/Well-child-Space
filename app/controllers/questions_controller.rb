class QuestionsController < ApplicationController
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
    @question = Question.find_by(id:params[:id])
  end

  def edit
    @question = Question.find_by(id:params[:id])
  end

  def update
    @question = Question.find_by(id:params[:id])
    if @question.update(question_params)
      redirect_to("/questions")
    else
      render("questions/edit")
    end
  end

  def destroy
    @question = Question.find_by(id:params[:id])
    if @question.destroy
      redirect_to("/questions")
    end
  end

  private
   
    def question_params
      params.require(:question).permit(:question_content, :question_image)
    end
   
end