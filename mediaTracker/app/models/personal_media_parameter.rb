class PersonalMediaParameter < ApplicationRecord
  belongs_to :users
  belongs_to :general_medias
end
