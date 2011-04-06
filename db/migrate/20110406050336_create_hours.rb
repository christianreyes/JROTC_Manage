class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.integer :roster_id
      t.integer :award_id
      t.integer :num_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
