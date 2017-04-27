class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  after_action :remove_session, only: [ :after_sign_out_path_for ]

  def after_sign_out_path_for(resource_or_scope)
      logger.info "params: #{params[:page_type]}"
      return unauthenticated_root_url(subdomain: "www") if params[:page_type] == "0" && Rails.env.production?
      return unauthenticated_root_url(subdomain: false) if params[:page_type] == "0" && !Rails.env.production?
      return professional_page_url if params[:page_type]== "1"
  end

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to authenticated_root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

  private

  def remove_session
    session[:page_type] = nil
  end

end
