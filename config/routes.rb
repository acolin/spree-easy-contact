Rails.application.routes.draw do
  match '/mark_as_read/:id' => 'contacts#mark_as_read'
  
  resources :contacts, :controller => 'contacts'
  
  namespace :admin do
    resources :contacts
    resources :topics
  end
end
