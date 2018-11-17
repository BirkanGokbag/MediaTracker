class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
         #confirmable, lockable, timeoutable

  attr_accessor :username

  #def login
  #  @login || self.username || self.email
  #end
end
