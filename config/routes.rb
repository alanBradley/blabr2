Rails.application.routes.draw do
  resources :profiles
  resources :locations
  resources :comments
  devise_for :users

  # if the user does not have a profile they will be redirected to a page to create one
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  
  # block resource for links and up/down votes on the links
  # also contains collection for searchkick functionality within links
  resources :links do
    collection do
      get 'search'
    end
  	member do
  		put "like", to:    "links#upvote"
  		put "dislike", to: "links#downvote"
  	end
  	resources :comments
  end

  root to: "links#index"

end
