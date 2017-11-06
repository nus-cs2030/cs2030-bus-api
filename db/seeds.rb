# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BUS_STOPS_PATH = "#{Rails.root}/db/csvs/bus-stops.csv"
BUS_SERVICES_PATH = "#{Rails.root}/db/csvs/bus-services.csv"
BUS_STOPS_SERVICES_PATH = "#{Rails.root}/db/csvs/bus-stops-services.csv"

File.foreach(BUS_STOPS_PATH) do |line|
  stop_number, longitude, latitude, stop_name = line.strip.split(',')

  BusStop.create(
    stop_number: stop_number,
    longitude: longitude.to_f,
    latitude: latitude.to_f,
    stop_name: stop_name
  )
end

File.foreach(BUS_SERVICES_PATH) do |line|
  service_number = line.strip

  BusService.create(service_number: service_number)
end

File.foreach(BUS_STOPS_SERVICES_PATH) do |line|
  stop_number, service_numbers = line.strip.split(':')
  service_numbers = service_numbers.split(',')

  bus_stop = BusStop.find_by(stop_number: stop_number)
  next if bus_stop.nil?

  bus_services = service_numbers.map do |service_number|
    BusService.find_by(service_number: service_number)
  end.reject(&:nil?)

  # Adds the association bidirectionally
  bus_stop.bus_services << bus_services
  bus_stop.save
end

puts 'Done!'
