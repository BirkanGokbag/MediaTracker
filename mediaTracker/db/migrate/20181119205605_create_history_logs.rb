class CreateHistoryLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :history_logs do |t|
      t.string :historyMessage
    end
  end
end
