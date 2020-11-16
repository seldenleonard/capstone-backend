class Api::ImagesController < ApplicationController

  before_action :authenticate_artist

  def create
    image = Image.new({
      artwork_id: params[:artwork_id],
      url: params[:url]
    })
    if image.save
      render json: { message: "Image uploaded successfully" }, status: 200 # OR I COULD RENDER THE ARTWORKS SHOW VIEW POTENTIALLY?
    else
      render json: { errors: image.errors.full_messages }, status: 422
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: { message: "The image has successfully been destroyed" }
  end


end