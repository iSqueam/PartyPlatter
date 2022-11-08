class User < ApplicationRecord
  has_many :characters
  has_many :campaigns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  # def function()
  # end
end
