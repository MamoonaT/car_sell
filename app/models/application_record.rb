# frozen_string_literal: true

# ApplicationRecord
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def favourite_exists
end
