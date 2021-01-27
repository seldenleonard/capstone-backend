class Api::UpvotesController < ApplicationController

  before_action :authenticate_user

  def create
    @upvote = Upvote.new({
      artwork_id: params[:artwork_id],
      user_id: current_user.id
    })
    if @upvote.save
    else
      render json: { errors: @upvote.errors.full_messages }, status: 422
    end
  end

  def destroy
    @upvote = Upvote.find_by(artwork_id: params[:artwork_id], user_id: current_user.id)
    @upvote.destroy
    render json: { message: "You have unliked this artwork" }
  end

end