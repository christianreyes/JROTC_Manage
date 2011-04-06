class CreateRibbons < ActiveRecord::Migration
  def self.up
    create_table :ribbons do |t|
      t.string :name
      t.text :description
      t.integer :seniority
      t.integer :num_hours
      t.integer :num_events

      t.timestamps
    end
  end

  def self.down
    drop_table :ribbons
  end
end
