class Ad < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:city, :milage, :car_make, :transmission_type, :price, :engine_type, :assembly_type,
                            :engine_capacity, :color]
  has_many_attached :images
  has_many :favourites
  belongs_to :user

  CITY = [%w[Lahore lahore], %w[Karachi karachi], %w[Islamabad islamabad], %w[Quetta quetta],
          %w[Peshawar peshawar], %w[Rawalpindi rawalpindi]].freeze
  COLOR = [%w[White white], %w[Blue blue], %w[Black black], %w[Grey grey], %w[Silver silver]].freeze
  CAR_MAKE = [%w[Honda honda], %w[Suzuki suzuki], %w[Toyota toyata], %w[Tesla tesla]].freeze
  ENGINE_CAPACITY = [%w[Upto_800cc Upto_800cc], %w[Upto_1000cc upto_1000cc], %w[upto_1500cc upto_1500cc]].freeze
  PRICE = [%w[Upto_5_lac upto_5_lac], %w[Upto_10_lac upto_10_lac], %w[upto_20_lac upto_20_lac]].freeze
end
