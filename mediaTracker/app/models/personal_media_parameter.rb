class PersonalMediaParameter < ApplicationRecord
  belongs_to :user
  belongs_to :general_media
end
