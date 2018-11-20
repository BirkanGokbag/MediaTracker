class AddCreatedAtToMany < ActiveRecord::Migration[5.1]
  def change
    add_column :history_logs, :created_at, :datetime
    add_column :personal_media_parameters, :created_at, :datetime
    add_column :general_medias, :created_at, :date
    add_column :history_logs, :updated_at, :datetime
    add_column :personal_media_parameters, :updated_at, :datetime
    add_column :general_medias, :updated_at, :date

    remove_column :history_logs, :timeStamp
    remove_column :personal_media_parameters, :timeStamp
    remove_column :general_medias, :creationDate
  end
end
