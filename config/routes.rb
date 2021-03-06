Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/status', to: 'status#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/daemons', to: 'daemons#index'
  get '/shelters/:shelter_id/daemons', to: 'shelter_daemons#index'
  get 'daemons/:id', to: 'daemons#show'
  get '/shelters/:shelter_id/daemons/new', to: 'shelter_daemons#new'
  post '/shelters/:shelter_id/daemons', to: 'shelter_daemons#create'
end
