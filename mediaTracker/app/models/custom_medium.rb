class CustomMedium < ApplicationRecord
  belongs_to :general_medias, class_name: "GeneralMedium"
  has_many "custom_media_entries", dependent: :destroy, foreign_key: :custom_medias_id
end
