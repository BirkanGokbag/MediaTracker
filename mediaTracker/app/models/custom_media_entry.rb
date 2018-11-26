class CustomMediaEntry < ApplicationRecord
    belongs_to :custom_medias, class_name: "CustomMedium"
end
