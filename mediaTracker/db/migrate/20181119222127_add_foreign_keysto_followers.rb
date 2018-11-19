class AddForeignKeystoFollowers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :followers, :users, column: :user
    add_foreign_key :followers, :users, column: :fTarget
  end
end
