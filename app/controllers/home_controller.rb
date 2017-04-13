class HomeController < ApplicationController

 #, only: [ :dashboard ]
 before_action :set_user

  def index
    @photos = Photo.take(4)#all.order(created_at: :desc).page(params[:page])
  end

  def feeds
    #@photos = Photo.all.order(created_at: :desc)
    if @user
      @photos = @user.photos.order(created_at: :desc).page(params[:page])
    else
      @photos = Photo.all.order(created_at: :desc).page(params[:page])
    end
  end

  def dashboard

  end

  def set_user
   if !request.subdomain.to_s.blank?
     subdomain=request.subdomain.to_s.gsub("www.", "")
     logger.info "subdomain : #{subdomain}"
     @user=User.friendly.find(subdomain) if request.subdomain != "www"
   end

 end

end
