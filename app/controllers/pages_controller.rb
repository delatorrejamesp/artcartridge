class PagesController < ApplicationController

  before_action :set_user

  before_action :get_feature_artists

  before_action :get_random_ad



  def about

  end

  def contact

  end

  def feature
    #@user = User.find(featured: true).first
    #User.where(featured: true
    @fa=@featured_artists.order("RANDOM()").first
    @photo = Photo.new
    if @fa.photos.any?
      @photo=@fa.photos.order("RANDOM()").first
      #commontator_thread_show(@photo)
    end

    @ig_photos=IgPhoto.instagram_photos(20)

    @ig_photos_sample=@ig_photos.sample
    @media_id =  params[:ig_id]  || @ig_photos_sample["id"]
    #commontator_thread_show(@ig_photos_sample)
    logger.info "#{@ig_photos_sample}"
    @comments = IgPhoto.media_comments( @media_id )

  end

  private

  def set_user
      unless request.subdomain.to_s.blank?
          subdomain = request.subdomain.to_s.gsub('www.', '')
          logger.info "subdomain : #{subdomain}"
          @user=User.friendly.find(subdomain) if request.subdomain != "www"
      end
  end

  def get_feature_artists
    @featured_artists = User.where(featured: true)
    @featured_artist =  User.where(featured: true).first
  end

  def get_random_ad
    @advertisement=Admin::Advertisement.order("RANDOM()").first
  end



end
