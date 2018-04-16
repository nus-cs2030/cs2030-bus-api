class BusServicesController < ApplicationController
  def show
    find_bus_service!
    respond_with @bus_service.bus_stops.join(',')
  end

  private

  def find_bus_service!
    @bus_service ||= BusService.find_by(service_number: params[:id])
    raise ActiveRecord::RecordNotFound if @bus_service.nil?
  end
end
