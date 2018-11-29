class Follower < ApplicationRecord
    #TODO
    #belongs_to :follower, foreign_key: "fTarget", class_name: "User"
    #belongs_to :followee, foreign_key: "user", class_name: "User"
    belongs_to :users, class_name: "User"

end
