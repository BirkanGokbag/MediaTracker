class Preference < ApplicationRecord
  belongs_to :users, touch: true, class_name: "User"
end
