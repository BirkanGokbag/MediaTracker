class Movie < ApplicationRecord
  belongs_to :general_medias, class_name: "GeneralMedium"
end
