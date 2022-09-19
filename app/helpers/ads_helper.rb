module AdsHelper
  def favourite_text
    @favourite_exists ? 'unfavourite' : 'favourite'
  end
end
