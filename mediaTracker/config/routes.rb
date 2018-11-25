Rails.application.routes.draw do
  resources :tv_shows
  resources :preferences
  resources :personal_media_parameters
  resources :musics
  resources :movies
  resources :magazines
  resources :history_logs
  resources :general_media
  resources :followers
  resources :custom_media
  resources :custom_media_entries
  resources :books
  resources :video_games
  get 'static_pages/home'
  get 'static_pages/addMedia'
  get 'static_pages/faq'

  devise_for :users
  root to: redirect('static_pages/home')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
