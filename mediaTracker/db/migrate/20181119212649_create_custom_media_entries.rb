class CreateCustomMediaEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_media_entries do |t|
      t.string :key
      t.string :value
    end
  end
end
