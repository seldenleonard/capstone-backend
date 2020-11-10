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
      @image = Image.create(
        url: params[:image_url],
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
    @artwork = Artwork.find(params[:id])
    if @artwork.user == current_user
      @artwork.title = params[:title] || @artwork.title
      @artwork.medium = params[:medium] || @artwork.medium
      @artwork.description = params[:description] || @artwork.description
      @artwork.price = params[:price] || @artwork.price
      @artwork.dimensions = params[:dimensions] || @artwork.dimensions
      @artwork.year = params[:year] || @artwork.year
      if @artwork.save
        render "show.json.jb"
      else
        render json: { errors: @artwork.errors.full_messages }, status: 422
      end
    else
      render json: { errors: @artwork.errors.full_messages }, status: 401
    end
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