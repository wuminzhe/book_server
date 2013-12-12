module Admin::SessionsHelper
  COOKIE_NAME = :remember_token_for_admin

  def sign_in(administrator, remember_password)

    remember_token = Administrator.new_remember_token
    if remember_password and remember_password=='yes'
      cookies.permanent[COOKIE_NAME] = remember_token
    else
      cookies[COOKIE_NAME] = remember_token
    end
    administrator.update_attribute(:remember_token, Administrator.encrypt(remember_token))

    self.current_user = administrator
  end

  def sign_out
    self.current_administrator = nil
    cookies.delete(COOKIE_NAME)
  end

  def signed_in?
    !current_administrator.nil?
  end

  #####
  def current_administrator=(user)
    @current_administrator = user
  end

  def current_administrator
    remember_token = Administrator.encrypt(cookies[COOKIE_NAME])
    @current_administrator ||= Administrator.find_by(remember_token: remember_token)
  end

  def current_administrator?(administrator)
    administrator == current_administrator
  end

  #####
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end
end
