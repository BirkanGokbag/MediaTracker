class CreateGeneralMedias < ActiveRecord::Migration[5.1]
  def change
    create_table :general_medias do |t|
      t.string :name
    end
  end
end
