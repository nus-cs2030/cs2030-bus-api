class CreateJoinTableBusStopBusService < ActiveRecord::Migration[5.1]
  def change
    create_join_table :bus_stops, :bus_services do |t|
      t.index [:bus_stop_id, :bus_service_id]
      t.index [:bus_service_id, :bus_stop_id]
    end
  end
end
