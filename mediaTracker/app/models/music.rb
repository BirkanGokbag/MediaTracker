class Music < ApplicationRecord
  belongs_to :general_medias, class_name: "GeneralMedium"
end
