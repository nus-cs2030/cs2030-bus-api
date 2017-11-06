class BusStop < ApplicationRecord
  has_and_belongs_to_many :bus_services, inverse_of: :bus_stop

  validates :stop_number, presence: true
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  validates :stop_name, presence: true
end
