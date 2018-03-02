class QuestionsController < ApplicationController
  before_action :set_user, only: [:unanswered_questions, :create]

  # this will be the access point to unanswered questions
  def unanswered_questions
    if is_signed_in? @user
      @unanswered_questions = @user.questions
    else
      flash[:error] = "You do not have permission to access this page!!!"
      redirect_to root_path
    end
  end

  # no new
  def new
  end

  def create
    @question = Question.new(question_params)
    @question.user = @user
    if @question.save
      flash[:notice] = "You question has been submitted"
    else
      flash[:error] = "There was a error with uploading your question. Please try again later"
    end
      redirect_to user_path(@user)
    # p @question
  end

  # maybe
  def show
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def question_params
    params.require(:questions).permit(:question)
  end
end
