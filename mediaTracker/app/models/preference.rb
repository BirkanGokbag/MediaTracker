class Preference < ApplicationRecord
  belongs_to :users, touch: true
end
