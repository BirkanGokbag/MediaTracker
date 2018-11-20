class AddTimeStampToHistoryLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :history_logs, :timeStamp, :datetime
    add_column :personal_media_preferences, :timeStamp, :datetime
    add_column :general_medias, :timeStamp, :datetime
  end
end
