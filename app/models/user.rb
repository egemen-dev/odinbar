class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates_presence_of :email
  validates_presence_of :username
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
