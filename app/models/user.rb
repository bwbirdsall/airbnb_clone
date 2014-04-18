class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :pictures
  has_many :reviews

  after_create :send_signup_confirmation



private
  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
