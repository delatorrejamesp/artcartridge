class HomeController < ApplicationController

  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: [ :dashboard ]

  def index
    #@photos = Photo.all.order(created_at: :desc)
    @photos = Photo.all.order(created_at: :desc).page(params[:page])
  end

  def dashboard

  end

end
