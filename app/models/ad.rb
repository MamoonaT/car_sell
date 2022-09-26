class Ad < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:city, :milage, :car_make, :transmission_type, :price, :engine_type, :assembly_type,
                            :engine_capacity, :color]
  has_many_attached :images
  has_many :favourites, :dependent => :destroy
  belongs_to :user
  validates :assembly_type, presence: true
  cattr_accessor :form_steps do
  	%w(details picture contact)
  end
  attr_accessor :form_step
  validates :assembly_type, :city, :milage, presence: true,
		if: -> { required_for_step?(:details) }
  validates_numericality_of :price, :milage, :greater_than => 0, presence: true,
    if: -> { required_for_step?(:details) }
  validates :primary_contact, :secondary_contact, phone: true,
      if: -> { required_for_step?(:contact) }


  CITY = [%w[Lahore lahore], %w[Karachi karachi], %w[Islamabad islamabad], %w[Quetta quetta],
          %w[Peshawar peshawar], %w[Rawalpindi rawalpindi]].freeze
  COLOR = [%w[White white], %w[Blue blue], %w[Black black], %w[Grey grey], %w[Silver silver]].freeze
  CAR_MAKE = [%w[Honda honda], %w[Suzuki suzuki], %w[Toyota toyata], %w[Tesla tesla]].freeze
  ENGINE_CAPACITY = [%w[Upto_800cc Upto_800cc], %w[Upto_1000cc upto_1000cc], %w[upto_1500cc upto_1500cc]].freeze
  PRICE = [%w[Upto_5_lac upto_5_lac], %w[Upto_10_lac upto_10_lac], %w[upto_20_lac upto_20_lac]].freeze

  private 

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
end
