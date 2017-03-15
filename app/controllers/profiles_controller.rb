class ProfilesController < ApplicationController

   before_action :set_user

   def com
     render "users/show"
   end

   def pro
     render "users/show_pro"
   end

   private

  def set_user

    if !request.subdomain.to_s.blank?
      subdomain=request.subdomain.to_s.gsub("www.", "")
      logger.info "subdomain : #{subdomain}"
      @user=User.friendly.find(subdomain)
    end

  end

end
