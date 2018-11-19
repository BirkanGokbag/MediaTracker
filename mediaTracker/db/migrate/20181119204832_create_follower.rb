class CreateFollower < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :followerId
    end
  end
end
