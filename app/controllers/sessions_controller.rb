class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.confirm(session_params)
    if @user
      p "found user......"
      login(@user)
      p "logged in worked......"
      redirect_to user_path(@user)
      return
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
    params.require(:user).permit(:email, :password)
  end
end
