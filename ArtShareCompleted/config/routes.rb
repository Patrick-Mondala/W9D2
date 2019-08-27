Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :likes
  end

  resources :artworks, only: [:show, :create, :update, :destroy] do
    resources :likes
    member do
      post 'favorite', to: 'artwork_shares#favorite'
      post 'unfavorite', to: 'artwork_shares#unfavorite'
    end
  end

  resources :artwork_shares, only: [:create, :destroy] do
    member do
      post 'favorite', to: 'artwork_shares#favorite'
      post 'unfavorite', to: 'artwork_shares#unfavorite'
    end
  end

  resources :comments, only: [:index, :create, :destroy] do
    resources :likes
  end

   #pass in artwork id / artworkshare id
    # nested in route

    #localhost:3000 pseudo 

    # render back the specific artwork / aw share thats favorited
    # if we are the owner then we can toggle the fav boolean 
    # if not the user then do nothing
      # end is to call the artwork of any particular artist (user_id)
      # and to call artwork shares that they themselves have favorited (viewer_id)
        # both of these go to a collection

        # user 1 and 2 


  # get "users/", to: "users#index", as: "users"
  # post "users/", to: "users#create"
  # get "users/new", to: "users#new", as: "new_user"
  # get "users/:id/edit", to: "users#edit", as: "edit_user"
  # get "users/:id", to: "users#show", as: "user"
  # put "users/:id", to: "users#update"
  # patch "users/:id", to: "users#update"
  # delete "users/:id", to: "users#destroy"


end