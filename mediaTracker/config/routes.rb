Rails.application.routes.draw do
  devise_for :views
  resources :tv_shows, except: [:show, :edit]
  resources :preferences
  resources :personal_media_parameters
  resources :musics, except: [:show, :edit]
  resources :movies, except: [:show, :edit]
  resources :magazines, except: [:show, :edit]
  resources :history_logs, only: [:index]
  resources :general_media, except: [:show, :edit]
  resources :followers, only: [:create, :delete]
  resources :custom_media
  resources :custom_media_entries
  resources :books, except: [:show, :edit]
  resources :video_games, except: [:show, :edit]
  get 'static_pages/home'
  get 'static_pages/addMedia'
  get 'static_pages/preferences'
  get 'static_pages/profile'
  get 'static_pages/faq'
  get 'static_pages/search_form'
  post 'static_pages/form'
  post 'static_pages/follow_form'
  post 'static_pages/preference_form'

  devise_for :users
  resources :users, :only => [:show, :follow] 
  root to: redirect('static_pages/home')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
