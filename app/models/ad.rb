class Ad < ApplicationRecord
	has_many_attached :images
	validate :count
	# belongs_to :user

	private
	def count
		return if images.count <= 2
		errors.add(:images, 'You can upload max 2 images')
	end
end
