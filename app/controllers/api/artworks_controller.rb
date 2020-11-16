class Api::ArtworksController < ApplicationController

  before_action :authenticate_artist, except: [:index, :show]

  def index
    @artworks = Artwork.all
    render "index.json.jb"
  end

  def create
    @artwork = Artwork.new({
      user_id: current_user.id,
      title: params[:title],
      medium: params[:medium],
      description: params[:description],
      price: params[:price],
      dimensions: params[:dimensions],
      year: params[:year],
    })
    if @artwork.save
      cloudinary_url = nil
      if params[:image]
        response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
        cloudinary_url = response["secure_url"]
      end
      @image = Image.create(
        url: cloudinary_url,
        artwork_id: @artwork.id
      )
      render "show.json.jb"
    else
      render json: { errors: @artwork.errors.full_messages }, status: 422
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render "show.json.jb"
  end

  def update
    cloudinary_url = nil
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
    end
    @artwork = Artwork.find(params[:id])
    if @artwork.user == current_user
      @artwork.title = params[:title] || @artwork.title
      @artwork.medium = params[:medium] || @artwork.medium
      @artwork.description = params[:description] || @artwork.description
      @artwork.price = params[:price] || @artwork.price
      @artwork.dimensions = params[:dimensions] || @artwork.dimensions
      @artwork.year = params[:year] || @artwork.year
      if @artwork.save
        # @artwork.images.each do |image|
        #   image.url = cloudinary_url || image.url
        # end
        @image = Image.create(
          url: cloudinary_url,
          artwork_id: @artwork.id
        )
        render "show.json.jb"
      else
        render json: { errors: @artwork.errors.full_messages }, status: 422
      end
    else
      render json: { errors: @artwork.errors.full_messages }, status: 401
    end
    # GENERALLY, BUT ESPECIALLY IN TERMS OF USING CLOUDINARY, SHOULDN'T THE UPDATE ACTION ALSO BE CREATING IMAGES? LOOK TO USERS CONTROLLER FOR REFERENCE OF HOW TO DO IT
  end  

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.user == current_user
      @artwork.destroy
      render json: { message: "The artwork has successfully been destroyed" }
    else
      render json: { message: "You must be the owner of this artwork to modify it" }
    end
  end

end