class Ad < ApplicationRecord
  has_many_attached :images
  has_many :favourites
  belongs_to :user
  validates :primary_contact, phone: true
  validates :secondary_contact, phone: true
  has_many :favourites
  validates :city, :car_make, :color, :transmission_type, :assembly_type, :engine_type, :milage, :engine_type, :price,
            :add_description, presence: true

  CITY = [%w[Lahore lahore], %w[Karachi karachi], %w[Islamabad islamabad], %w[Quetta quetta],
          %w[Peshawar peshawar], %w[Rawalpindi rawalpindi]].freeze
  COLOR = [%w[White white], %w[Blue blue], %w[Black black], %w[Grey grey], %w[Silver silver]].freeze
  CAR_MAKE = [%w[Honda honda], %w[Suzuki suzuki], %w[Toyota toyata], %w[Tesla tesla]].freeze
end
