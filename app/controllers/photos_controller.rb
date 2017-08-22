class PhotosController < ApplicationController

  before_action :set_photo, only: [ :show, :comments ]
  before_action :get_user, only: [ :take_three ]



  after_action :add_views, only: [:show]

  after_action :create_tools_ids, only: [ :create ]

  def index
    @photos = Photo.all.order(created_at: :desc).page(params[:page])
  end

  def new
    photo = Hash.new
    photo[:user_id] = current_user.id if current_user
    @photo = Photo.new(photo)

  end

  def show
      commontator_thread_show(@photo)
  end

  def comments
      commontator_thread_show(@photo)
  end

  def create
      @photo = Photo.new(photo_params.except(:tools_ids))
      @photo.user_id = current_user.id
      #@photo.save


      if @photo.save
          respond_to do |format|
            format.json
          end
      else
          respond_to do |format|
            format.json { redirect_to photos_url, flash: { :error => @photo.errors.full_messages.join(', ') } }
            format.js { redirect_to  photos_url, flash: { :error => @photo.errors.full_messages.join(', ') } }
            format.html { redirect_to root_url, flash: { :error => @photo.errors.full_messages.join(', ') } }
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
    params.require(:photo).permit( :image,
                        :title,
                        :description,
                        :social_description,
                        :professional_description,
                        :on_professional_page,
                        :same_description_on_professional_page,
                        :mature_content,
                        :medium,
                        :gene,
                        :subject_matter,
                        :tools_ids )
  end

  def get_user
      @photos = Photo.where(user_id: params[:user_id]).take(3)
  end

  def add_views
      if current_user
        @photo.increment(:views).save if current_user.id != @photo.user_id
      end
  end

  def create_tools_ids
      photo_params[:tools_ids].split(",").each do |tool|
        @photo.tools << Tool.find(tool)
      end
  end

end
