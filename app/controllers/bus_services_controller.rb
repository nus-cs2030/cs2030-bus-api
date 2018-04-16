class BusServicesController < ApplicationController
  def show
    find_bus_service!
    #respond_with @bus_service.bus_stops.join(',')
    result = ''
    @bus_service.bus_stops.each do |s|
      stop = BusStop.find_by stop_number: s
      result += s + ',' + stop.stop_name + "\n"
    end
    respond_with result
  end

  private

  def find_bus_service!
    @bus_service ||= BusService.find_by(service_number: params[:id])
    raise ActiveRecord::RecordNotFound if @bus_service.nil?
  end
end
