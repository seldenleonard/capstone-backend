class Api::UpvotesController < ApplicationController

  before_action :authenticate_user

  def create
    @upvote = Upvote.new({
      artwork_id: params[:artwork_id],
      user_id: current_user.id
    })
    if @upvote.save
      render json: { message: "You have upvoted this artwork" } # do I need a show or is this alright? I guess I dont need a whole show action so I probably dont need a show view right? ---- Dani says get rid of when I build my frontend and it will just show the heart box filled in
    else
      render json: { errors: @upvote.errors.full_messages }, status: 422
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id]) # -- Should this be more like "if current_user has upvoted this artwork, @upvote = the combination of current_user.id and artwork_id" My only worry is that the URL will exist to delete an upvote and although there wont be a clickable link, the URL will still not require authorization so presumably anyone could delete anyone else's upvote(s).
    @upvote.destroy
    render json: { message: "You have unliked this artwork" }
  end

end