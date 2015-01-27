class Hungrybee < ActiveRecord::Base
  attr_accessor :remember_token

  validates :name, presence: true, length: { maximum: 50}, if: :is_registered?
  validates :phone_number, presence: true, length: { is: 10 },
            numericality: { only_integer: true },
            uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :registered, presence:true

  def Hungrybee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
           BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def is_registered?
     return registered
  end

  # Returns a reandom token.
  def Hungrybee.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers a user in the databse for tuse in persisten sessions.
  def remember
    self.remember_token = Hungrybee.new_token
    update_attribute(:remember_digest, Hungrybee.digest(remember_token))
  end

  # Returns true if the gien token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgest a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


end
