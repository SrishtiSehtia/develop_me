class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
  has_many :questions

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  def full_name
    self.first_name + " " + self.last_name
  end

end
