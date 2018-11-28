class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :personal_media_parameters, :users
    add_column :followers, :users, foreign_key: true
  end
end
