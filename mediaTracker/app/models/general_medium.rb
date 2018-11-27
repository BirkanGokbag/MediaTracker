class GeneralMedium < ApplicationRecord
    has_one :custom_medium, dependent: :destroy, foreign_key: :general_media_id
    has_one :tv_show, dependent: :destroy, foreign_key: :general_media_id
    has_one :book, dependent: :destroy, foreign_key: :general_media_id
    has_one :magazine, dependent: :destroy, foreign_key: :general_media_id
    has_one :movie, dependent: :destroy, foreign_key: :general_media_id
    has_one :music, dependent: :destroy, foreign_key: :general_media_id
    has_one :video_game, dependent: :destroy, foreign_key: :general_media_id

    has_many :users, through: :personal_media_parameters
    has_many :personal_media_parameters, foreign_key: :general_media_id
end
