class UsersController < ApplicationController

  before_action :set_user, only: [ :edit, :update, :destroy, :show, :portfolio, :photos, :show_pro ]

  before_action :get_photos, only: [ :edit ]

  def profile

  end

  def edit

  end

  def show
    #@photos = @user.photos.order(created_at: :desc).page(params[:page])
    @photos = Photo.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  end

  def show_pro

  end

  def update
      user = Hash.new
      user[:first_name] = user_params[:first_name]
      user[:last_name] = user_params[:last_name]
      user[:username] = user_params[:username].downcase if user_params[:username]
      if user_params["birthday(1i)"] && user_params["birthday(2i)"] && user_params["birthday(3i)"]
        user[:birthday] =  Date.civil( user_params["birthday(1i)"].to_i, user_params["birthday(2i)"].to_i, user_params["birthday(3i)"].to_i)
      end
      user[:address] = user_params[:address]
      user[:about_me] = user_params[:about_me]
      user[:avatar] = user_params[:avatar] unless user_params[:avatar].blank?
      user[:banner] = user_params[:banner] unless user_params[:banner].blank?
      @user.update(user)
      if !@user.errors.any?
        redirect_to user_url(@user)
      end
  end

  def portfolio
    #@photos = @user.photos.order(created_at: :desc).page(params[:page])
    @photos = Photo.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
    render "photos/index"
  end

  def contact
    render "pages/contact"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :about_me, :birthday, :address, :avatar, :username, :banner)
  end

  def set_user
    subdomain=request.subdomain.to_s.gsub("www.", "")
    if !request.subdomain.to_s.blank? && subdomain != "www"
      logger.info "subdomain : #{subdomain}"
      @user=User.friendly.find(subdomain)
    else
      @user=User.friendly.find(params[:id])
    end
  end

  def get_photos
    @photos = Photo.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  end



end
