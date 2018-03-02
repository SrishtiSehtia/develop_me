class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  has_many :questions
  
end
