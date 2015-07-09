class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
    @result = Profile.where(:user_id => current_user.id).first
    if(@result.present?)
      request.env['omniauth.origin'] || stored_location_for(resource) || profile_path(@result.id)
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || new_profile_path
    end
  end
end 
