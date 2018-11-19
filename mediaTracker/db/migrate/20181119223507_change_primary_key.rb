class ChangePrimaryKey < ActiveRecord::Migration[5.1]
  def change
   # remove_column :users, :id
    #execute "ALTER TABLE users ADD PRIMARY KEY (username);"
  end
end
