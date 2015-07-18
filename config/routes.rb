Rails.application.routes.draw do
  resources :comments
  devise_for :users
  
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
