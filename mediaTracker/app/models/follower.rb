class Follower < ApplicationRecord

    belongs_to :follower, foreignkey: "fTarget", class_name: "User"
    belongs_to :followee, foreign_key: "user", class_name: "User"

end
