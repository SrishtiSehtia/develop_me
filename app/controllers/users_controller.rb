class UsersController < ApplicationController
  before_action :set_page, only: [:index, :show]

  def index
    @users = User.all

    @pages = Paginator.new(@users, 3)
    @page = @pages[ @page_number ]
    @page = @page ? @page.elements : []

    @url = Addressable::Template.new( "/users{?page}")

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = 'There was a problem with Signing you up. Please try again later.'
      redirect_to new_user_path
    end
  end

  def show
    user_id = params[:id]

    @user = User.find(user_id)
    @logged_in = is_signed_in? @user
    @question_list = @user.questions.where.not(answer: nil)

    @pages = Paginator.new(@question_list, 5)
    @page = @pages[ @page_number ]
    @page = @page ? @page.elements : []

    @url = Addressable::Template.new( "#{user_path(@user)}{?page}")

  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def set_page
    @page_number = params[:page].nil? ? 1 : params[:page].to_i
  end

end
