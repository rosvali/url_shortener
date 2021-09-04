Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:new, :create, :index]
  get '/:id_url', to: 'urls#show'
end
