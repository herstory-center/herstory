class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :require_login

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    # def require_login
    #   redirect :'sessions/new' unless logged_in?
    # end


    def logout
      session.delete(:user_id)
      @current_user = nil
    end

    def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
    end

    def store_location
    session[:forwarding_url] = request.original_url if request.get?
    end

private
  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
