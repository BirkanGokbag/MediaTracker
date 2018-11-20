json.extract! movie, :id, :director, :general_medias_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
