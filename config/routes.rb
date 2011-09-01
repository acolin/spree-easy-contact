Rails.application.routes.draw do
    
  resources :contacts, :controller => 'contacts' do
    get 'mark_as_read', :on => :member
  end
  
  namespace :admin do
    resources :contacts
    resources :topics
  end
end
