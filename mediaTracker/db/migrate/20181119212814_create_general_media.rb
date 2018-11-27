class CreateGeneralMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :general_media do |t|
      t.string :name
    end
  end
end
