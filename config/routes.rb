Rails.application.routes.draw do
  
devise_for :users

 resources :posts do
 	member do
 		get "like", to: "posts#upvote"
 	end
 	resources :infos, except: [:show, :index]
 	resources :comments
 end

 resources :welcome
 resources :groups
 resources :videos do
 	member do
 		get "like", to: "posts#upvote"
 	end
 	resources :infos, except: [:show, :index]
 	resources :comments

 end

 resources :uploads


 root 'posts#index'

 get '/videos', to:'videos#index' 
 get '/about', to:'welcome#about'
 get '/map', to:'groups#map'
 get '/user', to:'welcome#user'
 get '/youtube', to:'welcome#youtube'
 get '/community', to:'welcome#community'
 get '/groups', to:'groups#index'
end
