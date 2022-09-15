# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def favourite_text
    @favourite_exists ? 'unfavourite' : 'favourite'
  end
end
