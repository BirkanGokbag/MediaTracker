class AddUserIdToPersonalParemeters < ActiveRecord::Migration[5.1]
  def change
    add_column :personal_media_parameters, :users_id, :string
  end
end
