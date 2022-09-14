class Ad < ApplicationRecord
	has_many_attached :images
	has_many :favourites
	belongs_to :user
	validates :primary_contact, phone: true
	validates :secondary_contact, phone: true

end
