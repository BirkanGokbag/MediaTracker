class AddFieldsToFollowers < ActiveRecord::Migration[5.1]
  def change
    add_column :followers, :user, :string
    add_column :followers, :fTarget, :string
  end
end
