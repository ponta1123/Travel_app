# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :email, :encrypted_password, :city, :prefectural])
  end
end
