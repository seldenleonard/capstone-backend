class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create, :show]

  def create
    cloudinary_url = nil
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
    end
    @user = User.new({
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      artist: params[:artist],
      bio: params[:bio],
      art_style: params[:art_style],
      image_url: cloudinary_url,
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
    @user = current_user
    cloudinary_url = nil
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
      cloudinary_url = response["secure_url"]
    end
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.artist = params[:artist] || @user.artist
    @user.bio = params[:bio] || @user.bio
    @user.art_style = params[:art_style] || @user.art_style
    @user.image_url = cloudinary_url || @user.image_url
    @user.college_id = params[:college_id] || @user.college_id
    @user.major = params[:major] || @user.major
    @user.minor = params[:minor] || @user.minor
    @user.graduation_year = params[:graduation_year] || @user.graduation_year
    if params[:password]
      @user.password = params[:password] || @user.password
      @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    end
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