class CreateTvShows < ActiveRecord::Migration[5.1]
  def change
    create_table :tv_shows do |t|
      t.integer :numberOfSeasons
      t.integer :totalEpisodes
    end
  end
end
