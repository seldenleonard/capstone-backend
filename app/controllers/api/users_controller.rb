class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create, :show]

  # ISSUE 2: I dont want a new user to input their college_id, but rather have them enter a college and I store the college_id.
  def create
    @user = User.new({
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      artist: params[:artist],
      bio: params[:bio],
      art_style: params[:art_style],
      image_url: params[:image_url],
      college_id: params[:college_id], # I dont want people to have to enter a number, and I know most of this will be done on frontend, but is this how it should look on my backend?
      major: params[:major],
      minor: params[:minor],
      graduation_year: params[:graduation_year]
    })
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
  
  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def update
    @user = current_user
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    # Depending on how I handle password and password_confirmation vs password digest in my "create" method, will dictate what I put in here. Ask if I need both "password" and "password_confirmation", because on the frontend I ask for both, or if I can get away with just sending "password" and not "password_confirmation from the backend if I am asking for both on the frontend?"
    @user.artist = params[:artist] || @user.artist
    @user.bio = params[:bio] || @user.bio
    @user.art_style = params[:art_style] || @user.art_style
    @user.image_url = params[:image_url] || @user.image_url
    @user.college_id = params[:college_id] || @user.college_id
    @user.major = params[:major] || @user.major
    @user.minor = params[:minor] || @user.minor
    @user.graduation_year = params[:graduation_year] || @user.graduation_year
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end

  def destroy
    current_user.destroy
    render json: { message: "The user has successfully been destroyed" }
  end

end