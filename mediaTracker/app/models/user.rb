# This is the model for the User
#
# Author: Alyssa Langhals (Adding associations)
# Created on: 11/19
class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
         #:confirmable#, lockable, timeoutable

  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  #self.primary_key = :username


  #Set up table association
  has_one :preference, dependent: :destroy, foreign_key: :users_id
  has_many :history_logs, dependent: :destroy, foreign_key: :users_id
  has_many :personal_media_parameters, dependent: :destroy, foreign_key: :users_id
  has_many :general_media, through: :personal_media_parameters
  has_many :personal_media_parameters, foreign_key: :users_id

  #Associations for followers
  #TODO
  has_many :followers, foreign_key: :users_id, dependent: :destroy
  #has_many :followers, through: :follower_follows, source: :follower
  #has_many :follower_follows, foreign_key: :user, class_name: "Follower"

  #has_many :followees, through: :followee_follows, source: :followee
  #has_many :follwee_follows, foreign_key: :fTarget, class_name: "Follower"
  #Source: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
end
