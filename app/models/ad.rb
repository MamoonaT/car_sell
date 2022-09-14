class Ad < ApplicationRecord
	has_many_attached :images
	has_many :favourites
	belongs_to :user
	validates :primary_contact, phone: true
	validates :secondary_contact, phone: true
  has_many :favourites

CITY = [['Lahore','lahore'],['Karachi' , 'karachi'],['Islamabad' , 'islamabad'],['Quetta' , 'quetta'],['Peshawar', 'peshawar'],['Rawalpindi', 'rawalpindi']]
COLOR = [['White' , 'white'],['Blue' , 'blue'],['Black', 'black'],['Grey', 'grey'],['Silver' , 'silver']]	
CAR_MAKE = [['Honda', 'honda'],['Suzuki', 'suzuki'],['Toyota', 'toyata'],['Tesla', 'tesla']]
end

