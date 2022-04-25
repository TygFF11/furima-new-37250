Rails.application.routes.draw do
  devise_for :users

  resources :items, only:[:index]
  get "items/index" => "items#index"
  
end
