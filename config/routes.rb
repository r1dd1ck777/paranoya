Rails.application.routes.draw do
  root to: 'static#index'
  get '/code/:code' => 'static#code'
  get '/js' => 'static#js'
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
