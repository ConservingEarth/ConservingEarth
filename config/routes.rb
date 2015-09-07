Rails.application.routes.draw do
  
devise_for :users

 resources :posts do
 	member do
 		get "like", to: "posts#upvote"
 	end
 	resources :infos, except: [:show, :index]
 	resources :comments
 end
 resources :user
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
 get '/user', to:'user#show'
 get '/youtube', to:'welcome#youtube'
 get '/groups', to:'groups#index'
 get '/settings', to:'user#edit'
 get '/activity', to: 'user#activity'
 get '/dashboard', to: 'user#dashboard'
 get '/favorites', to: 'user#favorites'
 get '/inbox', to: 'user#inbox'
 get '/mygroups', to: 'user#mygroups'
 get '/profile', to: 'user#profile'
 get '/friends', to: 'user#friends'
 get '/community', to: 'user#community'
end
