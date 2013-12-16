class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def set_qb_service(type = 'Vendor')
      oauth_client = OAuth::AccessToken.new($qb_oauth_consumer, session[:token], session[:secret])
      @service = "Quickeebooks::Online::Service::#{type}".constantize.new
      @service.access_token = oauth_client
      @service.realm_id = session[:realm_id]
    end
end
