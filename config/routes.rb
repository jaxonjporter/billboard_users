Rails.application.routes.draw do
    root "lists#index"
    resources :artists do
      resources :songs
    end
    resources :lists do
      resources :songs
    end

    resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
