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

  #Associations for followers
  has_many :followers, through: :follower_follows, source: :follower
  has_many :follower_follows, foreign_key: :user, class_name: "Follower"

  has_many :followees, through: :followee_follows, source: :followee
  has_many :follwee_follows, foreign_key: :fTarget, class_name: "Follower"
  #Source: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
end
