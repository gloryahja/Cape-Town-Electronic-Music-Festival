Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  
  get 'welcome/index'

  resources :profiles
  resources :pictures

  root 'welcome#index'

class Users::RegistrationsController < Devise::RegistrationsController
 protected
   def after_sign_up_path_for(resource)
     @result = Profile.where(:user_id => current_user.id).first

     if(@result.present?)
       request.env['omniauth.origin'] || stored_location_for(resource) || profile_path(@result.id)
     else
       request.env['omniauth.origin'] || stored_location_for(resource) || new_profile_path
     end
   end

   def after_update_path_for(resource)
     signed_in_root_path(resource)
   end
 end 
  
end
