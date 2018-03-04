require "simply_paginate"

class UsersController < ApplicationController

  include SimplyPaginate

  def index
    @users = User.all
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
      flash[:error] = 'Error'
      redirect_to new_user_path
    end
  end

  def show
    p "redirecting to user profile........."
    user_id = params[:id]
    @page_number = params[:page].nil? ? 1 : params[:page].to_i
    @user = User.find(user_id)
    @logged_in = is_signed_in? @user
    @question_list = @user.questions.where.not(answer: nil)

    @pages = Paginator.new(@question_list, 2)

    @page = @pages[ @page_number ]

  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
