class CreateRosters < ActiveRecord::Migration
  def self.up
    create_table :rosters do |t|
      t.integer :event_id
      t.integer :cadet_id
      t.time :sign_in_time
      t.time :sign_out_time

      t.timestamps
    end
  end

  def self.down
    drop_table :rosters
  end
end
