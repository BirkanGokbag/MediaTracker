class CreatePreference < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.binary :wallpaper
      t.integer :fontSize
      t.string :font
      t.binary :profilePicture
      t.boolean :privacy
      t.string :fontColor
    end
  end
end
