class UsersController < ApplicationController

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
      redirect_to user_new_path
    end
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_params)
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
