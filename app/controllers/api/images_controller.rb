class Api::ImagesController < ApplicationController

  before_action :authenticate_artist

  def create
    response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
    cloudinary_url = response["secure_url"]
    @image = Image.new({
      artwork_id: params[:artwork_id],
      url: cloudinary_url
    })
    if @image.save
      render "show.json.jb"
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: { message: "The image has successfully been destroyed" }
  end


end