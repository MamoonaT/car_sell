class FavouritesController < ApplicationController
  def index; end

  def update
    favourite = Favourite.where(ad: Ad.find(params[:ad]), user: current_user)
    mark_favourite(favourite)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def mark_favourite(favourite)
    if favourite == []
      Favourite.create(ad: Ad.find(params[:ad]), user: current_user)
      @favourite_exists = true
    else
      Favourite.destroy_all
      @favourite_exists = false
    end
  end
end
