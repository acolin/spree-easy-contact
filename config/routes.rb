Rails.application.routes.draw do  
  resources :contacts, :controller => 'contacts'
  
  namespace :admin do
    resources :contacts
    resources :topics
  end
end
