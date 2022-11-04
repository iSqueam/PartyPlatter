class User < ApplicationRecord
  has_many :characters
  has_many :campaigns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
         #:jwt_authenticatable, jwt_revocation_strategy: self
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
end
