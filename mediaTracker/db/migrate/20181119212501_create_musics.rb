class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :album
    end
  end
end
