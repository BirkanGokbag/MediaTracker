class CustomMediaEntry < ApplicationRecord
    belongs_to :custom_media, class_name: "CustomMedium"
end
