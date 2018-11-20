json.extract! history_log, :id, :historyMessage, :users_id, :created_at, :updated_at
json.url history_log_url(history_log, format: :json)
