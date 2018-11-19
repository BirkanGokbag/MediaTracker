class CreateVideoGames < ActiveRecord::Migration[5.1]
  def change
    create_table :video_games do |t|
      t.string :studio
      t.string :system
    end
  end
end
