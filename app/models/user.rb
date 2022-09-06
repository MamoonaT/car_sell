# frozen_string_literal: true

# class user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, length: { minimum: 5, maximum: 30 }
  validates :encrypted_password,
            format: { with: /\A[a-zA-Z0-9. ! @ # $ % ^ & * ( ) _ - + =]+\Z/,
                      message: '(minimum 8 characters are required with at least one capital letter
                      and a special character)' }
  validates :phone_number, format: { with: /\A\d{4}\d{7}\z/ }
  attr_writer :login

  def login
    @login || phone_number || email
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
