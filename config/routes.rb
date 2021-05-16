Rails.application.routes.draw do
  resources :game_players, except: :destroy
  resources :players
  resources :games, except: :destroy
  resources :stadia
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
