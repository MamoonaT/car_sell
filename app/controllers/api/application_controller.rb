class Api::ApplicationController < ActionController::API
  before_action :set_default_format

  protected

  def set_default_format
    request.format = :json
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
