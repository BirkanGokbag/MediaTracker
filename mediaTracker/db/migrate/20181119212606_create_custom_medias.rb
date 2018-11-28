class CreateCustomMedias < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_media do |t|
      t.string :typeOfMedia
    end
  end
end
