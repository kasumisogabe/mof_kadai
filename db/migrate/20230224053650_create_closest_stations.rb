class CreateClosestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :closest_stations do |t|
      t.string :line_name
      t.string :station
      t.integer :time
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
