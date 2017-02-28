class PhotosController < ApplicationController

  before_action :set_photo, only: [ :show ]

  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def new
    photo = Hash.new
    photo[:user_id] = current_user.id if current_user
    @photo = Photo.new(photo)
  end

  def show

  end

  def create
      @photo = Photo.new(photo_params)
      @photo.save
      redirect_to photos_url
  end

  private

  def set_photo
    @photo=Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:user_id,:image, :title, :description)

  end

end
