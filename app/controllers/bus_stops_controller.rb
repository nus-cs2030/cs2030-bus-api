class BusStopsController < ApplicationController
  def show
    find_bus_stop!
    respond_with bus_services
  end

  def nearby
    find_bus_stop!

    nearby_bus_stops = []
    BusStop.all.each do |bus_stop|
      next if @bus_stop == bus_stop
      nearby_bus_stops << bus_stop.stop_number if @bus_stop.nearby?(bus_stop)
    end

    respond_with nearby_bus_stops.join(',')
  end

  private

  def find_bus_stop!
    @bus_stop ||= BusStop.find_by(stop_number: params[:id])
    raise ActiveRecord::RecordNotFound if @bus_stop.nil?
  end

  def bus_services
    @bus_stop.bus_services.join(',')
  end
end
