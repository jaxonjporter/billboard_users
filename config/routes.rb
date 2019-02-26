Rails.application.routes.draw do
    devise_for :users
    root "artists#index"
    resources :artists do
      resources :songs
    end
    resources :lists do
      resources :songs
    end

    get "/lists/:list_id/songs_list", to: "songs#songs_list", as: "songs_list"
    get "/lists/:list_id/add_song/:id", to: "songs#add_song_list", as: "add_song_list"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
