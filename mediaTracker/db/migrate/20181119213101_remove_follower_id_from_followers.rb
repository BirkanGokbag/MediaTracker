class RemoveFollowerIdFromFollowers < ActiveRecord::Migration[5.1]
  def change
    remove_column :followers, :followerId, :integer
  end
end
