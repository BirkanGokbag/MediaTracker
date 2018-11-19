class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    #preferences
    add_reference :preferences, :users, index: true, foreign_key: true

    #history log
    add_reference :history_logs, :users, index: true, foreign_key: true

    #personal media
    add_reference :personal_media_parameters, :users, index: true, foreign_key: true
    add_reference :personal_media_parameters, :general_medias, index: true, foreign_key: true

    #followers
    add_reference :followers, :users, index: true, foreign_key: true
    add_reference :followers, :users, index: true, foreign_key: true

    #medias
    add_reference :tv_shows, :general_medias, index: true, foreign_key: true
    add_reference :musics, :general_medias, index: true, foreign_key: true
    add_reference :movies, :general_medias, index: true, foreign_key: true
    add_reference :magazines, :general_medias, index: true, foreign_key: true
    add_reference :books, :general_medias, index: true, foreign_key: true
    add_reference :video_games, :general_medias, index: true, foreign_key: true

    #customMedias
    add_reference :custom_medias, :general_medias, index: true, foreign_key: true
    

  end
end
