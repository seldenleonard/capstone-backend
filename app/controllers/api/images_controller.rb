class Api::ImagesController < ApplicationController

  before_action :authenticate_artist

  def create
    image = Image.new({
      artwork_id: params[:artwork_id], # Is there a way for me to automate this process, instead of having someone enter the artwork id, can I have it use the current artwork being created or updated? Or is this something I do in the frontend?
      url: params[:url]
    })
    if image.save
      render json: { message: "Image uploaded successfully" }, status: 200 # I decided to render json instead of a show view because uploading images will be in a form and you can upload multiple images, so I think this is better?
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