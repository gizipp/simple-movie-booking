Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'movies#index'
  get 'users/new'   => 'users#new', as: :new_user
  post 'users'      => 'users#create'
  get '/login'      => 'sessions#new'
  post '/login'     => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get 'movies/:id'  => 'movies#show', as: :movies
  get 'bookings'    => 'users#booking', as: :bookings
  post 'bookings/:id/cancel'    => 'users#cancel_booking', as: :cancel_bookings
  post 'book/:screening_id' => 'users#book', as: :book
end
