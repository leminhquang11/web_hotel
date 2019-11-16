Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users
    resources :users, only: %i(index show destroy)
    get "admin_hotels", to: "hotels#admin_index"
    get "admin_hotels/:id", to: "hotels#admin_show"
    resources :hotels
  end
end
