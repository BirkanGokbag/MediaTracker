class AddTimeStampToHistoryLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :history_logs, :timeStamp, :datetime
    add_column :personal_media_parameters, :timeStamp, :datetime
    add_column :general_media, :timeStamp, :datetime
  end
end
