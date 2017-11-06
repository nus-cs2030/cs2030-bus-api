class BusService < ApplicationRecord
  has_and_belongs_to_many :bus_stops, inverse_of: :bus_service

  validates :service_number, presence: true
end
