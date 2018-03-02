class QuestionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    @question.user = User.find(params[:user_id])
    if @question.save
      flash[:notice] = "You question has been submitted"
    else
      flash[:error] = "There was a error with uploading your question. Please try again later"
    end
      redirect_to user_path(@question.user)
    # p @question
  end

  def show
  end

  def destroy
  end

  private
  def question_params
    params.require(:questions).permit(:question)
  end
end
