Rails.application.routes.draw do
  resources :profiles
  resources :locations
  resources :comments
  devise_for :users

  # if the user does not have a profile they will be redirected to a page to create one
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  
  # block resource for links and up/down votes on the links
  resources :links do
  	member do
  		put "like", to:    "links#upvote"
  		put "dislike", to: "links#downvote"
  	end
  	resources :comments
  end

  root to: "links#index"

end
