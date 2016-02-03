class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token
  protect_from_forgery with: :null_session
  include SessionsHelper

    private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        login_url
      end
    end

    def default_serializer_options
      {root: false}
    end

end
