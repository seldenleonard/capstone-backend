Rails.application.routes.draw do

  namespace :api do
    
    # User Routes
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    # Session Routes
    post "/sessions" => "sessions#create"
  
    # Artwork Routes
    get "/artworks" => "artworks#index"
    post "/artworks" => "artworks#create"
    get "/artworks/:id" => "artworks#show"
    patch "/artworks/:id" => "artworks#update"
    delete "/artworks/:id" => "artworks#destroy"

    # College Routes
    get "/colleges" => "colleges#index"
    get "/colleges/:id" => "colleges#show"

    # Image Routes
    post "/images" => "images#create"
    delete "/images/:id" => "images#destroy"

    # Upvote Routes
    post "/upvotes" => "upvotes#create"
    delete "/upvotes/:artwork_id" => "upvotes#destroy"

  end

end
