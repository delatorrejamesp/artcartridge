class PagesController < ApplicationController

  before_action :set_user

  def about

  end

  def contact

  end

  private

  def set_user
      unless request.subdomain.to_s.blank?
          subdomain = request.subdomain.to_s.gsub('www.', '')
          logger.info "subdomain : #{subdomain}"
          @user = User.friendly.find(subdomain)
      end
  end

end
