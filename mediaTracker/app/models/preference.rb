class Preference < ApplicationRecord
  belongs_to :user, touch: true
end
