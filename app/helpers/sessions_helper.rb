module SessionsHelper

  #Logs in the given user.
  def log_in(hungrybee)
    session[:hungrybee_id] = hungrybee.id
  end

  #Remembers a user in a persistent session.
  def remember(hungrybee)
    hungrybee.remember
    cookies.permanent.signed[:hungrybee_id] = hungrybee.id
    cookies.permanent[:remember_token] = hungrybee.remember_token
  end

  #Returns the current logged-in user (if any).
  def current_hungrybee
    if (hungrybee_id = session[:hungrybee_id])
      @current_hungrybee ||= Hungrybee.find_by(id: hungrybee_id)
    elsif (hungrybee_id = cookies.signed[:hungrybee_id])
      hungrybee = Hungrybee.find_by(id: hungrybee_id)
      if hungrybee && hungrybee.authenticated?(cookies[:remember_token])
        log_in hungrybee
        @current_hungrybee = hungrybee
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_hungrybee.nil?
  end

  def log_out
    forget(@current_hungrybee)
    session.delete(:hungrybee_id)
    @current_hungrybee = nil
  end

  #Forgets a persistent session.
  def forget(hungrybee)
    hungrybee.forget
    cookies.delete(:hungrybee_id)
    cookies.delete(:remember_token)
  end

end
