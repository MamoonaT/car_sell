class CheckoutController < ApplicationController
  before_action :set_ad

  def create
    @session = Checkout.call(ad: @ad, success_or_cancel_url: root_url).session
    respond_to { |format| format.js }
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
