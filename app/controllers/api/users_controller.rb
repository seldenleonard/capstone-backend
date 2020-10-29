class Api::UsersController < ApplicationController

  before_action: :authenticate_user, except: [:create]

  # ISSUE 1: It works but creates 2 "User" instances when sent through to server.
  # ISSUE 2: I dont want user to input their college_id, but rather have them enter a college and I store the college_id.
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
      college_id: params[:college_id],
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
    @user = User.find(params[:id])
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    # Depending on how I handle password and password_confirmation vs password digest in my "create" method, will dictate what I put in here.
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
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "The user has successfully been destroyed"}
  end

end