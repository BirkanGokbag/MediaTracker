class CreatePersonalMediaParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_media_parameters do |t|
      t.integer :score
      t.string :currentStatus
      t.boolean :favorite
      t.text :comments
      t.string :source
      t.integer :replay
    end
  end
end
