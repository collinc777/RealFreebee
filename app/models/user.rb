class User < ActiveRecord::Base
  has_many :points, dependent: :destroy
  validates :name, :age, :city, :state, presence: true
  validates_inclusion_of :age, :in => 0..99
end
