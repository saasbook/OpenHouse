class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :google_map_static_helper

  # Takes address or coordinate pair
  def google_map_static_helper(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end
end
