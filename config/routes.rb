Rails.application.routes.draw do

  resources :url_articles
  devise_for :users
  
  resources :articles do
  	resources :reviews, except: [:show, :index]
  end

  resources :contents, only: [:index]
 
  root 'articles#index'

end
