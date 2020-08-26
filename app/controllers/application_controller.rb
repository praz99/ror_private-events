class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return unless logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to root_path
  end
end
