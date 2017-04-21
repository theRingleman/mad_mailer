Rails.application.routes.draw do
  devise_for :users
  resources :accounts do 
  	collection do
  		post :import
  		get :send_emails
  	end
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'accounts#index'
end
