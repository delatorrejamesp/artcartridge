class HomeController < ApplicationController

  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: [ :dashboard ]

  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def dashboard

  end

end
