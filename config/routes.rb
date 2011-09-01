Rails.application.routes.draw do
    
  resources :contacts, :controller => 'contacts'
    
  namespace :admin do
    resources :contacts do
      get 'mark_as_read', :on => :member
    end
    resources :topics
  end
end
