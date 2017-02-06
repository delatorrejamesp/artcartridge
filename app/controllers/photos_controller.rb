class PhotosController < ApplicationController


  def index
    @photos = Photo.all
  end

  def new
    photo = Hash.new
    photo[:user_id] = current_user.id if current_user
    @photo = Photo.new(photo)
  end

  def create
      @photo = Photo.new(photo_params)
      @photo.save
      redirect_to photos_url
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id,:image, :description)

  end

end
