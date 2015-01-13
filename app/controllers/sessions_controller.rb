class SessionsController < ApplicationController
  def new
  end

  def create
    hungrybee = Hungrybee.find_by(phone_number: params[:session][:phone_number])
    if hungrybee && hungrybee.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in hungrybee
      params[:session][:remember_me] == '1' ? remember(hungrybee) : forget(hungrybee)
      redirect_to hungrybee
    else
      #create an error message.
      flash.now[:danger] = 'Invalid phone number/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
