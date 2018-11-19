class CreateMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :magazines do |t|
      t.integer :issue
    end
  end
end
