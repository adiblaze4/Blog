Rails.application.routes.draw do
  get 'welcome/index'
  # articles controller created and Action create , read,update,delete
  # Resource is collection of similar objects(CRUD operation)

  resources :articles do
    resources :comments
  end

  root 'welcome#index' # this provide routing to connect the view to controller when request recieve from browser
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
