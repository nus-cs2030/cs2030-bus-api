class BusService < ApplicationRecord
  validates :service_number, presence: true, uniqueness: { case_sensitive: false }
end
