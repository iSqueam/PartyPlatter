class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :authentication_keys => [:username], :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, 
         config.mailer_sender = 'no-reply@partyplatter.com'
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
