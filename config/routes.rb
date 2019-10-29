Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :gossips
   resources :author

   root 'gossips#index'
   get '/static_pages/team', to: 'static_pages#team', as: 'team'
   get '/static_pages/contact', to: 'static_pages#contact', as: 'contact'
   get '/welcome/:index', to: 'welcome#index'
end
