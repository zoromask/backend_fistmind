Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/welcome',  to: 'welcome#index'
  # get '/welcome/list-message/:id',  to: 'welcome#list'
  get '/welcome/list-message', to: 'welcome#list', as: 'listMessage'
  get '/welcome/new-message/:id', to: 'welcome#new', as: 'newMessage'
  post '/welcome/save-message', to: 'welcome#save', as: 'saveMessage'
  root 'sessions#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
