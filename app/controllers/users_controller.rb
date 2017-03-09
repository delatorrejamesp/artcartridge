class UsersController < ApplicationController

  before_action :set_user, only: [ :edit, :update, :destroy, :show, :portfolio, :photos, :show_pro ]

  def profile

  end

  def edit

  end

  def show
    @photos = @user.photos.order(created_at: :desc).page(params[:page])
  end

  def show_pro

  end

  def update
      user = Hash.new
      user[:first_name] = user_params[:first_name]
      user[:last_name] = user_params[:last_name]
      user[:username] = user_params[:username].downcase
      if user_params["birthday(1i)"] && user_params["birthday(2i)"] && user_params["birthday(3i)"]
        user[:birthday] =  Date.civil( user_params["birthday(1i)"].to_i, user_params["birthday(2i)"].to_i, user_params["birthday(3i)"].to_i)
      end
      user[:address] = user_params[:address]
      user[:about_me] = user_params[:about_me]
      user[:avatar] = user_params[:avatar] unless user_params[:avatar].blank?
      @user.update(user)
      if !@user.errors.any?
        redirect_to user_url(@user)
      end
  end

  def portfolio
    @photos = @user.photos.order(created_at: :desc).page(params[:page])
    render "photos/index"
  end

  def contact
    render "pages/contact"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :about_me, :birthday, :address, :avatar, :username)
  end

  def set_user
    @user=User.friendly.find(params[:id])
  end



end
