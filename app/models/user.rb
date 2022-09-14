class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :username, length: { maximum: 30 }
  validates :password, format: {
    with: /\A[a-zA-Z0-9. ! @ # $ % ^ & * ( ) _ - + =]+\Z/,
    message: '(minimum 8 characters are required with at least one capital letter and a special character)'
  }
  validates :phone_number, phone: true
  has_many :favourites
  attr_writer :login
  has_many :ads
  has_many :favourites

  def login
    @login ||= phone_number.presence || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['phone_number = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:phone_number) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
