class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # raise
    # stored_location_for(resource)
    params[:redirect_to]
  end
end
