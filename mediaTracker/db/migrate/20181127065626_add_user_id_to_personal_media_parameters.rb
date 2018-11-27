class AddUserIdToPersonalMediaParameters < ActiveRecord::Migration[5.1]
  def change
    add_column :personal_media_parameters, :general_medias_id, :string
  end
end
