Rails.application.routes.draw do
  resources :game_players
  resources :players
  resources :games
  resources :stadia
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
