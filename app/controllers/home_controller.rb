class HomeController < ApplicationController

 #, only: [ :dashboard ]

  def index
    #@photos = Photo.all.order(created_at: :desc)
    @photos = Photo.all.order(created_at: :desc).page(params[:page])
  end

  def dashboard

  end

end
