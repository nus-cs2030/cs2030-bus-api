class CreateBusStops < ActiveRecord::Migration[5.1]
  def change
    create_table :bus_stops do |t|
      t.string :stop_number, null: false, index: true
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :stop_name, null: false

      t.timestamps
    end
  end
end
