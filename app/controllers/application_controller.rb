class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  after_action :remove_session, only: [ :after_sign_out_path_for ]

  def after_sign_out_path_for(resource_or_scope)
      logger.info "params: #{params[:page_type]}"
      #page_type
      return unauthenticated_root_url #if params[:page_type] == "0"
      #return professional_page_url if params[:page_type]== "1"
      #return unauthenticated_root_path(subdomain: false)  if params[:page_type] == 1
      #unauthenticated_root_path(subdomain: false)
      # subdomain=request.subdomain.to_s.gsub("www.", "")
      # logger.info "subdomain : #{subdomain}"
      #@user=User.friendly.find(subdomain)

  end

  private

  def remove_session
    session[:page_type] = nil
  end

end
