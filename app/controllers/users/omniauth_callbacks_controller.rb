class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(**from_google_params)

    if user.present?
      sign_out_all_scopes
      flash[:success] = t('devise.omniauth_callbacks.success', kind: 'Google')
      sign_in_and_redirect(user, event: :authentication)
    else
      flash[:alert] = t('devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized.")
      redirect_to(new_user_session_path)
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    sign_in_path
  end

  def after_sign_in_path_for(resource_or_scope)
    # this really serves no purpose after the first login, unless they want a special pop up for loggin for the x-th time? -daniel
    current_user.update!(signInCount: (current_user.signInCount + 1))

    if current_user.signInCount == 1

      # this if block is to check if the new user has been referred by someone and rewards that someone with 1 point
      # not the best way as a user could make a ton of referrals for random emails and if those emails sign up w/o knowledge of being referred then it would be unjust points
      # maybe auto email for being referred could help, or a referral code? -Daniel
      reffed = Referral.find_by(email: current_user.email)
      unless reffed.nil?
        if reffed.admin_approved.nil? && !reffed.admin_approved
          PoinEvent.create!(user_id: reffed.old_member, balance: (Point.find_by(name:"Friend Referral").val || 1), date: DateTime.now,
                            description: 'You referred x y using email: z'.gsub(/[xyz]/, 'x' => reffed.guest_first_name, 'y' => reffed.guest_last_name, 'z' => reffed.email)
          )
        end
      end

      # this statement is for first time users to fill out their profiles
      stored_location_for(resource_or_scope) || edit_user_session_path

    elsif current_user.admin == true
      # admins have their special dashboard
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
      avatar_url: formatUserImg(auth.info.image)
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def formatUserImg(input)
    input.sub! '=s96-c' , '=s200-c'
  end
  
end
