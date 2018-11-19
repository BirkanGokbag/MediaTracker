class CreateCustomMedias < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_medias do |t|
      t.string :type
    end
  end
end
