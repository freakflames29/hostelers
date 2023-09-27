class

ApplicationController < ActionController::Base

  helper_method :logged_in? ,:current_user
  def current_user
    @current_user||=session[:user] if session[:id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless  logged_in?
      flash[:fail]="Login to perform this step !"
      redirect_to login_path
    end
  end

   def checkpoints
    if logged_in?
      flash[:ok] = "You are already logged in"
      redirect_to user_path(session[:id])
    end
  end

end
