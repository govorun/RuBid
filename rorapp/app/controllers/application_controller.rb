class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorise_user!
    if ! current_user.try(:admin?)
      flash[:alert] = "Unauthorised"
      redirect_to ''
    end
  end

end
