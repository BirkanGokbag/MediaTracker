Rails.application.routes.draw do
  devise_for :views
  resources :tv_shows
  resources :preferences
  resources :personal_media_parameters
  resources :musics
  resources :movies
  resources :magazines
  resources :history_logs, only: [:index]
  resources :general_media
  resources :followers, except: [:edit, :update]
  resources :custom_media
  resources :custom_media_entries
  resources :books
  resources :video_games
  

  get 'static_pages/home'
  get 'static_pages/addMedia'
  get 'static_pages/faq'
  post 'static_pages/form'
  devise_for :users
  root to: redirect('static_pages/home')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
