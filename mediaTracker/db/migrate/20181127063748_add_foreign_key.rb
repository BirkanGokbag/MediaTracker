class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :personal_media_parameters, :users
  end
end
