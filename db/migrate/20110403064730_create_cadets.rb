class CreateCadets < ActiveRecord::Migration
  def self.up
    create_table :cadets do |t|
      t.string :name
      t.integer :platoon
      t.timestamps
    end
  end

  def self.down
    drop_table :cadets
  end
end
