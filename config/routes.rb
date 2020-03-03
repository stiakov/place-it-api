Rails.application.routes.draw do
  resources :reservations
  resources :projections
  resources :movies
  resources :users

  get 'projections/filter/:showtime', to: 'projections#filter', as: :projections_by_day
  get 'reservations/filter/:showtime', to: 'reservations#filter', as: :reservations_by_day
end
