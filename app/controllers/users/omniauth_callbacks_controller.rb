class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = GoogleUserFinder.new(request.env['omniauth.auth']).perform

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
    def facebook
    @user = FacebookUserFinder.new(request.env["omniauth.auth"]).perform

    if @user.persisted?
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env['omniauth.auth'].except(:extra)
       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
   def github
    @user = GithubUserFinder.new(request.env["omniauth.auth"]).perform

    if @user.persisted?
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.github_data"] = request.env['omniauth.auth'].except(:extra)
       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end


end
