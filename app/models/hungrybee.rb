class Hungrybee < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50}
  validates :phone_number, presence: true, length: { is: 10 },
            numericality: { only_integer: true },
            uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end