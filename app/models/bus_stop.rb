class BusStop < ApplicationRecord
  validates :stop_number, presence: true, uniqueness: { case_sensitive: false }
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  validates :stop_name, presence: true

  def nearby?(bus_stop)
    raise ArgumentError, '`bus_stop` is not a BusStop' unless bus_stop.is_a?(BusStop)
    distance_between(longitude, latitude, bus_stop.longitude, bus_stop.latitude) <= NEARBY_DISTANCE
  end

  private

  NEARBY_DISTANCE = 0.00360036

  def distance_between(x1, y1, x2, y2)
    Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
  end
end
