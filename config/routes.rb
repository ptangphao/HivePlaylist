Rails.application.routes.draw do
	root 'videos#index'
	post '/videos' => 'videos#create'
	resources :videos, only: ['destroy']
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
