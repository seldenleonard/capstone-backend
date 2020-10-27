Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    
    # User Routes
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
  
    # Artwork Routes
    get "/artworks" => "artworks#index"
    post "/artworks" => "artworks#create"
    get "/artworks/:id" => "artworks#show"
    patch "/artworks/:id" => "artworks#update"
    delete "/artworks/:id" => "artworks#destroy"

  end

end
