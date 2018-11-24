class AddCustomMediaIdToCustomMediaEntries < ActiveRecord::Migration[5.1]
  def change
    add_reference :custom_media_entries, :custom_medium, index: true, foreign_key: true
  end
end
