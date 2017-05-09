class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  after_action :remove_session, only: [ :after_sign_out_path_for ]

  before_action :get_setting #, :get_qoutes

  def after_sign_out_path_for(resource_or_scope)
      logger.info "params: #{params[:page_type]}"
      return unauthenticated_root_url(subdomain: "www") if params[:page_type] == "0" && Rails.env.production?
      return unauthenticated_root_url(subdomain: false) if params[:page_type] == "0" && !Rails.env.production?
      return professional_page_url if params[:page_type]== "1"
      super
  end

  def after_sign_in_path_for(resource)
      return rails_admin_url if resource.admin
      super
  end

  rescue_from CanCan::AccessDenied do |exception|
      if current_user
          redirect_to main_app.authenticated_root_url, alert: exception.message
      else
        redirect_to main_app.unauthenticated_root_url, alert: exception.message
      end
  end

  private

  def remove_session
    session[:page_type] = nil
  end

  def get_setting
    session[:setting] = Admin::Setting.find(1)
  end

  # def get_qoutes
  #   session[:qoutes] = Admin::Qoute.where(setting_id: session[:setting] )
  # end

end
