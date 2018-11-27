Rails.application.routes.draw do
  devise_for :views
  resources :tv_shows
  resources :preferences
  resources :personal_media_parameters
  resources :musics
  resources :movies
  resources :magazines
  resources :history_logs
  resources :general_medias
  resources :followers
  resources :custom_media
  resources :custom_media_entries
  resources :books
  resources :video_games
  #resources :users

  get 'static_pages/home'
  get 'static_pages/addMedia'
  get 'static_pages/faq'
  post 'static_pages/tv_form'
<<<<<<< HEAD

=======
>>>>>>> bf05a5ba347a707ad0563b9a59a525b4d3ed12cb
  devise_for :users
  root to: redirect('static_pages/home')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
