Rails.application.routes.draw do

  root 'home#index'

  resources :phone_numbers
end
