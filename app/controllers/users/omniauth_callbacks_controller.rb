class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token, :only => [:intuit]

  def intuit
    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Intuit"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.intuit_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
