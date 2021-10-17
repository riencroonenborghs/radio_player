class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :country_code, null: false
      t.string :name, null: false
      t.string :website
      t.string :stream_url, null: false
      t.text :description

      t.timestamps
    end
  end
end
