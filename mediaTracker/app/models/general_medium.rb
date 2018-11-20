class GeneralMedium < ApplicationRecord
    has_one :custom_medium, dependent: :destroy
    has_one :tv_show, dependent: :destroy
    has_one :book, dependent: :destroy
    has_one :magazine, dependent: :destroy
    has_one :movie, dependent: :destroy
    has_one :music, dependent: :destroy
    has_one :video_game, dependent: :destroy
end
