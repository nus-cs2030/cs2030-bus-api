class BusServicesController < ApplicationController
  def index
    render plain: bus_services_csv
  end

  private

  def bus_services_csv
    csv_path = "#{Rails.root}/lib/csvs/bus-services.csv"
    File.read(csv_path)
  end
end
