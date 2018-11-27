class PersonalMediaParameter < ApplicationRecord
  belongs_to :users, class_name: "User"
  belongs_to :general_media, class_name: "GeneralMedium"
end
