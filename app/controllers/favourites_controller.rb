class FavouritesController < ApplicationController
  before_action :set_ad, only: %i[update]

  def index
    @favourites = current_user.favourites.page(params[:page])
  end

  def update
    result = UpdateFavourite.call(ad: @ad, user: current_user)
    @favourite_exists = result.favourite_exists
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
