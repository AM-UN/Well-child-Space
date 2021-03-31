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


  private
   
    def question_params
      params.require(:question).permit(:question_content, :question_image)
    end
   
end