class CheckoutController < ApplicationController
  before_action :set_ad

  def create
    @session = Checkout.call(ad: @ad,
                             success_or_cancel_url: ad_ad_step_url(@ad, 'contact',
                                                                   checkout_succeeded: true)).session
    respond_to { |format| format.js }
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
