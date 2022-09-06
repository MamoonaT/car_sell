# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  # before_action :update_allowed_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_attrs = %i[username phone_number email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # def update_allowed_parameters
  #   devise_parameter_sanitizer.permit :sign_up) { |u| u.permit(:username, :phone_number, :email, :password)}
  #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :phone_number, :email, :password,
  # :current_password )}
  # end
end
