class UserMailer < ApplicationMailer
  # def welcome_email(user)
  #   @user = user
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def contact_us(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(from: @user[:email], to: "marcellino.ornelas@gmail.com", subject: 'Develop-me contact us')
  end
end
