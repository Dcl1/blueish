Rails.application.routes.draw do

  resources :url_articles
  devise_for :users
  


  resources :contents do
  	resources :url_articles
    resources :articles do
  		 resources :reviews, except: [:show, :index]
  	end
  end

  resources :contents, only: [:index]
 
  root 'contents#index'

end
