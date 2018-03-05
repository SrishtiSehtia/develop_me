class MainController < ApplicationController
  def home
  end

  def about
  end

  def contact_us
    UserMailer.contact_us(email_params).deliver_now
    redirect_to root_path
  end

  private
  def email_params
    params.require(:email).permit(:first_name,:last_name,:email,:message)
  end
end
