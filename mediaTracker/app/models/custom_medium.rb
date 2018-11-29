class CustomMedium < ApplicationRecord
  belongs_to :general_media, class_name: "GeneralMedium"
  has_many :custom_media_entries, dependent: :destroy, foreign_key: :custom_media_id
end
