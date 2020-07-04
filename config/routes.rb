Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/status', to: 'status#index'
end