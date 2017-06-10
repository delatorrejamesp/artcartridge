class PhotosController < ApplicationController

  before_action :set_photo, only: [ :show ]
  before_action :get_user, only: [ :take_three ]

  after_action :add_views, only: [:show]

  def index
    @photos = Photo.all.order(created_at: :desc).page(params[:page])
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
      @photo.user_id = current_user.id
      @photo.save
      if @photo.save!
          respond_to do |format|
            format.json{ render :json => @photo }
          end
      end
  end

  def take_three

  end

  private

  def set_photo
    @photo=Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit( :image, :title, :description)

  end

  def get_user
      @photos = Photo.where(user_id: params[:user_id]).take(3)
  end

  def add_views
      if current_user
        @photo.increment(:views).save if current_user.id != @photo.user_id
      end
  end

end
