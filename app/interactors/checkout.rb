class Checkout < ApplicationInteractor
  include Interactor
  delegate :ad, :session, :success_or_cancel_url, to: :context

  def call
    context.session = stripe_session
  end

  private

  def stripe_product
    Stripe::Product.create({ name: ad.add_description })
  end

  def stripe_price
    Stripe::Price.create({
                           unit_amount: ad.price,
                           currency: 'usd',
                           product: stripe_product.id,
                         })
  end

  def stripe_session
    Stripe::Checkout::Session.create({
                                       payment_method_types: ['card'],
                                       line_items: [{
                                         price: stripe_price.id,
                                         quantity: 1,
                                       }],
                                       mode: 'payment',
                                       success_url: success_or_cancel_url,
                                       cancel_url: success_or_cancel_url,
                                     })
  end
end
