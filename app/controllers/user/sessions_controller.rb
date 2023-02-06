# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
 before_action :configure_permitted_parameters, if: devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer(:sign_up, keys: [:email, :password])
 end


end
