class UpdateFavourite
  include Interactor

  delegate :ad, :user, :favourite_exists, to: :context

  def call
    toggle_favourite
  end

  private

  def toggle_favourite
    favourite = user.favourites.exists?(ad_id: ad.id)
    if favourite
      user.favourites.find_by(ad_id: ad.id).destroy
      context.favourite_exists = false
    else
      user.favourites.create(ad: ad)
      context.favourite_exists = true
    end
  end
end
