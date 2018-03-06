class SessionsController < ApplicationController
  before_action :redirect_signed_in, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(session_params)
    if @user
      login(@user)
      redirect_to @user
    else
      flash[:error] = 'Incorrect email or password'
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  private
  def session_params
    params.permit(:email, :password)
  end

  def redirect_signed_in
    if current_user
      redirect_to user_path(current_user)
    end
  end
end
