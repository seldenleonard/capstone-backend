class Api::UpvotesController < ApplicationController

  def create
    @upvote = Upvote.new({
      artwork_id: params[:artwork_id],
      user_id: params[:user_id]
    })
    if @upvote.save
      render json: { message: "You have upvoted this artwork" } # do I need a show or is this alright? I guess I dont need a whole show action so I probably dont need a show view right? ---- get rid of when I build my frontend and it will just show the heart box filled in
    else
      render json: { errors: @upvote.errors.full_messages }, status: 422
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    render json: { message: "You have unliked this artwork" }
  end

end