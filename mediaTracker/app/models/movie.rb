class Movie < ApplicationRecord
  belongs_to :general_media, class_name: "GeneralMedium"
end
