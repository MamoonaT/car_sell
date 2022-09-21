class CheckoutController < ApplicationController
  def create
    ad = Ad.find(params[:id])
    product = Stripe::Product.create({ name: ad.add_description })
    price = Stripe::Price.create({
                                   unit_amount: 2000,
                                   currency: 'usd',
                                   product: product.id,
                                 })
    @session =
      Stripe::Checkout::Session.create({
                                         payment_method_types: ['card'],
                                         line_items: [{
                                           price: price.id,
                                           quantity: 1,
                                         }],
                                         mode: 'payment',
                                         success_url: root_url,
                                         cancel_url: root_url,
                                       })
    respond_to do |format|
      format.js
    end
  end
end
