class Proparty < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :age, presence: true
  has_many :near_stations, dependent: :destroy
  accepts_nested_attributes_for :near_stations, allow_destroy: true
end
