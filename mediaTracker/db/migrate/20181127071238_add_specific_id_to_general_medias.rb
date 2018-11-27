class AddSpecificIdToGeneralMedias < ActiveRecord::Migration[5.1]
  def change
    add_column :general_medias, :specific_medias_id, :string
  end
end
