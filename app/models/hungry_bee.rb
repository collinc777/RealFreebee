class HungryBee < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates(:name, presence: true, length: { maximum: 50 })
  #need to make sure that regex is everything we want
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false })
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates( :phone_number, presence: true, length: { is: 10},
             uniqueness: true)
end