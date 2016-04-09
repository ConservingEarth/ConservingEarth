Rails.application.routes.draw do
  
devise_for :users
devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end

 resources :posts do
 	member do
 		get "like", to: "posts#upvote"
 	end
 	resources :infos, except: [:show, :index]
 	resources :comments
 end
 resources :members, path: '/groups/:id/members'
 resources :user
 resources :friendships
 resources :projects
 resources :events
 resources :messages
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

 get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
 get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
 get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

 resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
 root 'posts#index'

 get '/videos', to:'videos#index' 
 get '/messages', to:'messages#index'
 get '/about', to:'welcome#about'
 get '/map', to:'groups#map'
 get '/user', to:'user#show'
 get '/friends', to:'user#friends'
 get '/managegroups', to:'user#managegroups'
 get '/manageevents', to:'user#manageevents'
 get '/manageprojects', to:'user#manageprojects'
 get '/youtube', to:'welcome#youtube'
 get '/groups', to:'groups#index'
 get '/settings', to:'user#edit'
 get '/activity', to: 'user#activity'
 get '/dashboard', to: 'user#dashboard'
 get '/favorites', to: 'user#favorites'
 get '/inbox', to: 'user#inbox'
 get '/mygroups', to: 'user#mygroups'
 get '/profile', to: 'user#profile'
 get '/community', to: 'user#community'
 get '/secretpath', to: 'user#user'
 get '/groups/:group_friendly_id/members/:id', to: 'members#index'
end
