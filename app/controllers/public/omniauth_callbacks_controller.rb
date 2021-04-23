class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_from(:google)
  end

  private

  def callback_from(provider)
    @customer = Customer.find_for_oauth(request.env['omniauth.auth'])

    if @customer.persisted?
      sign_in_and_redirect @customer, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_date"] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end
end
