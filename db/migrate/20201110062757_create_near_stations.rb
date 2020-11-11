class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :minutes
      t.references :proparty, foreign_key: true
      t.timestamps
    end
  end
end
