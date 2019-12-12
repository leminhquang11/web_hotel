Rails.application.routes.draw do
  get 'service_reviews/create'
  get "book_room", to: "services#book_room"
  get "pay", to: "services#pay"

  root "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: %i(index show destroy) do
    resources :schedules, only: %i(index create destroy) do
      resources :schedule_items, only: %i(index destroy edit create)
    end
  end
  get "/search", to: "home#search"
  get "services", to: "services#index"
  get "services/:id/confirm" , to: "services#confirm", :as => :service_confirm
  get "services/categories/:category_id", to: "services#index", :as => :service_categories
  get "services/:id" , to: "services#show", :as => :service_details
  resources :service_reviews, only: %i(create destroy)

  get "service_bookings/payment" , to: "service_bookings#payment", :as => :service_payment
  resources :service_bookings
  get "services_in_place/:place_id", to: "services#services_in_place", :as => :services_in_place

end
