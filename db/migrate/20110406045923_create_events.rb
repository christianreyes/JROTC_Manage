class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :description
      t.integer :cadet_in_charge_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
