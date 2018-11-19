class ChangeDataTypeOfFollowers < ActiveRecord::Migration[5.1]
  def change

     change_column :followers, :user, :integer
     change_column :followers, :fTarget, :integer
  end
end
