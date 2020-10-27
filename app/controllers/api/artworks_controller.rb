class Api::ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    render "index.json.jb"
  end

  def create
    @artwork = Artwork.new({
      # user_id: params[:user_id], # Will need to change user_id to be current user instead of param
      user_id: current_user.id,
      title: params[:title],
      medium: params[:medium],
      description: params[:description],
      price: params[:price],
      dimensions: params[:dimensions],
      year: params[:year],
    })
    if @artwork.save
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
  end  

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    render json: {message: "The artwork has successfully been destroyed"}
  end

end