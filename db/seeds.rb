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

puts 'Seeding bus stops...'
File.foreach(BUS_STOPS_PATH) do |line|
  stop_number, latitude, longitude, stop_name = line.strip.split(',')

  BusStop.create!(
    bus_services: [],
    stop_number: stop_number,
    longitude: longitude.to_f,
    latitude: latitude.to_f,
    stop_name: stop_name
  )
end

puts 'Seeding bus services...'
File.foreach(BUS_SERVICES_PATH) do |line|
  service_number = line.strip

  BusService.create!(
    bus_stops: [],
    service_number: service_number
  )
end

puts 'Seeding bus stops - bus services...'
File.foreach(BUS_STOPS_SERVICES_PATH) do |line|
  stop_number, service_numbers = line.strip.split(':')
  service_numbers = service_numbers.split(',')

  bus_stop = BusStop.find_by(stop_number: stop_number)
  next if bus_stop.nil?

  bus_services = []
  service_numbers.reject! do |service_number|
    bus_service = BusService.find_by(service_number: service_number)
    bus_services << bus_service unless bus_service.nil?
    bus_service.nil?
  end

  bus_stop.bus_services += service_numbers
  bus_stop.save!

  bus_services.each do |bus_service|
    bus_service.bus_stops << stop_number
    bus_service.save!
  end
end

puts 'Done!'
