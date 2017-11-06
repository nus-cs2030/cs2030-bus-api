class BusStopsController < ApplicationController
  def index
    render plain: bus_stops_csv
  end

  private

  def bus_stops_csv
    csv_path = "#{Rails.root}/lib/csvs/bus-stops.csv"
    File.read(csv_path)
  end
end
