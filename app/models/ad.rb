class Ad < ApplicationRecord
	has_many_attached :images
	has_many :favourites

	# belongs_to :user

end
