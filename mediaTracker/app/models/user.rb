class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #confirmable, lockable, timeoutable

  validates :username, uniqueness: true

  self.primary_key = :username


  #Set up table association
  has_one :preference, dependent: :destroy
  has_many :history_logs, dependent: :destroy
end
