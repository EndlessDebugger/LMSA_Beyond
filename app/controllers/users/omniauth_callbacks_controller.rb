class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(**from_google_params)

    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_admin_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    current_user.update(signInCount: (current_user.signInCount+1))

    if current_user.signInCount == 1
      stored_location_for(resource_or_scope) || edit_user_session_path
    elsif current_user.admin == true
      stored_location_for(resource_or_scope) || admin_root_path
    else
      stored_location_for(resource_or_scope) || root_path
    end
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      full_name: auth.info.full_name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end