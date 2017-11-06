class BusStop < ApplicationRecord
  validates :stop_number, presence: true, uniqueness: { case_sensitive: false }
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  validates :stop_name, presence: true
end
