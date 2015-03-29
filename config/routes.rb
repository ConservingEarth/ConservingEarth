Rails.application.routes.draw do
  

  devise_for :users
 resources :posts do
 	resources :comments
 end

 resources :welcome

 resources :videos do
 	resources :infos, except: [:show, :index]
 	resources :comments

 end




 root 'posts#index'

 get '/videos', to:'videos#index' 
 get '/about', to:'welcome#about'
 get '/map', to:'welcome#map'
 get '/user', to:'welcome#user'
end
