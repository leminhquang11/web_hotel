Rails.application.routes.draw do
  get 'sessions/new'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users
    resources :users, only: %i(index show destroy)
    get "admin_hotels", to: "hotels#admin_index"
    get "admin_hotels/:id", to: "hotels#admin_show"
    resources :hotels
  end
  get "about_us", to: "static_pages#about_us"
  get "term_condition", to: "static_pages#term_condition"
  get "privacy_policy", to: "static_pages#privacy_policy"
  get "room", to: "static_pages#room"


  get "book_room", to: "hotels#book_room"
  get "pay", to: "hotels#pay"
  
end
