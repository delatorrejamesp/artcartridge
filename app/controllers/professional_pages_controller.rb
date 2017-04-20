class ProfessionalPagesController < ApplicationController
    before_action :set_user
    before_action :set_session

    def index

      if @user
        @photos = @user.photos.order(created_at: :desc).page(params[:page])
      else
        @photos = Photo.all.order(created_at: :desc).page(params[:page])
      end

    end

    def pro
        render 'users/show_pro'
    end

    def portfolio
        get_photos
        render 'photos/index'
    end

    def contact
        render 'pages/contact'
    end

    def shop
        render 'pages/shop'
    end

    def about
        render 'pages/about'
    end

    private

    def get_photos
        @photos = Photo.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
    end

    def set_user
        unless request.subdomain.to_s.blank?
            subdomain = request.subdomain.to_s.gsub('www.', '')
            logger.info "subdomain : #{subdomain}"
            @user = User.friendly.find(subdomain) if request.subdomain != 'www'
        end
    end

    def set_session
        session[:page_type] = 1
    end
end
