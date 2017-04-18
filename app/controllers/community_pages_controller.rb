class CommunityPagesController < ApplicationController


  before_action :set_user

  before_action :set_session

  def index

    if @user
      @photos = @user.photos.order(created_at: :desc).page(params[:page])
    else
      @photos = Photo.all.order(created_at: :desc).page(params[:page])
    end

  end

  def com
      logger.info " session[:page_type] : #{session[:page_type]}"
      get_photos
      render 'users/show'
  end


  private

  def get_photos
      @photos = Photo.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  end

  def set_user
      unless request.subdomain.to_s.blank?
          subdomain = request.subdomain.to_s.gsub('www.', '')
          logger.info "subdomain : #{subdomain}"
          @user = User.friendly.find(subdomain) if request.subdomain != "www"
      end
  end

  def set_session
    session[:page_type] = 0 # community_page
  end

end
