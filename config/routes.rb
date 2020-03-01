Rails.application.routes.draw do
  resources :reservations
  resources :projections
  resources :movies
  resources :users

  get 'projections/filter/:showtime', to: 'projections#filter', as: :projections_by_day
end
