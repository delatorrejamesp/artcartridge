class PagesController < ApplicationController

  before_action :set_user

  before_action :get_feature_artists

  def about

  end

  def contact

  end

  def feature
    #@user = User.find(featured: true).first
    #User.where(featured: true)
    commontator_thread_show(@featured_artist)

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

end
