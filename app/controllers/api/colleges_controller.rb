class Api::CollegesController < ApplicationController

  def index
    @colleges = College.all
    render "index.json.jb"
  end

  def show
    @college = College.find(params[:id])
    render "show.json.jb"
  end

end