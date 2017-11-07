class BusStopsController < ApplicationController
  def show
    find_bus_stop!
    render plain: bus_services
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
